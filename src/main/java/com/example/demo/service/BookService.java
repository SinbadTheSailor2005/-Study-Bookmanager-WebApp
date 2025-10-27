package com.example.demo.service;

import com.example.demo.model.Book;

import java.util.List;

public interface BookService {
  public void addBook(Book book);
  public void updateBook(Book book);
  public void removeBook(int id);
  public List<Book> listBooks();
  public Book getBookById(int id);
}
