package com.example.demo.service;

import com.example.demo.dao.BookRepository;
import com.example.demo.model.Book;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;


@Service
public class BookServiceImplementation implements BookService {

  private final BookRepository bookRepository;

  public BookServiceImplementation(BookRepository bookRepository) {
    this.bookRepository = bookRepository;
  }

  @Transactional
  @Override
  public void addBook(Book book) {
    this.bookRepository.save(book);
  }

  @Transactional
  @Override
  public void updateBook(Book book) {
    this.bookRepository.save(book);

  }

  @Transactional
  @Override
  public void removeBook(int id) {
    Optional<Book> bookToRemove = this.bookRepository.findById(id);
    bookToRemove.ifPresent(this.bookRepository::delete);
  }

  @Transactional
  @Override
  public List<Book> listBooks() {
    return this.bookRepository.findAll();
  }

  @Override
  public Book getBookById(int id) {
    return this.bookRepository.findById(id).orElse(null);
  }
}
