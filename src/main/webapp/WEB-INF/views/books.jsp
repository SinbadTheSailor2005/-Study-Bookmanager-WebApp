<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Управление книгами</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }

        .header p {
            font-size: 1.2em;
            opacity: 0.9;
        }

        .content {
            padding: 30px;
        }

        .section {
            margin-bottom: 40px;
        }

        .section h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 1.8em;
            border-bottom: 3px solid #4facfe;
            padding-bottom: 10px;
        }

        .books-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }

        .books-table th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .books-table td {
            padding: 15px;
            border-bottom: 1px solid #eee;
            transition: background-color 0.3s ease;
        }

        .books-table tr:hover td {
            background-color: #f8f9ff;
        }

        .books-table tr:last-child td {
            border-bottom: none;
        }

        .action-btn {
            display: inline-block;
            padding: 8px 16px;
            margin: 2px;
            border: none;
            border-radius: 20px;
            text-decoration: none;
            font-size: 0.9em;
            font-weight: 500;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .edit-btn {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
        }

        .edit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(79, 172, 254, 0.4);
        }

        .delete-btn {
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 100%);
            color: white;
        }

        .delete-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.4);
        }

        .view-btn {
            background: linear-gradient(135deg, #51cf66 0%, #40c057 100%);
            color: white;
        }

        .view-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(81, 207, 102, 0.4);
        }

        .form-container {
            background: #f8f9ff;
            padding: 25px;
            border-radius: 10px;
            border: 2px solid #e3f2fd;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
            font-size: 1.1em;
        }

        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 1em;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus {
            outline: none;
            border-color: #4facfe;
            box-shadow: 0 0 0 3px rgba(79, 172, 254, 0.1);
        }

        .submit-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 25px;
            font-size: 1.1em;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #666;
        }

        .empty-state h3 {
            font-size: 1.5em;
            margin-bottom: 15px;
            color: #999;
        }

        .empty-state p {
            font-size: 1.1em;
            line-height: 1.6;
        }

        .back-btn {
            display: inline-block;
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 20px;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        .back-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(108, 117, 125, 0.4);
        }

        @media (max-width: 768px) {
            .books-table {
                font-size: 0.9em;
            }
            
            .books-table th,
            .books-table td {
                padding: 10px 8px;
            }
            
            .action-btn {
                padding: 6px 12px;
                font-size: 0.8em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📚 Управление книгами</h1>
            <p>Добавляйте, редактируйте и просматривайте вашу коллекцию книг</p>
        </div>

        <div class="content">
            <a href="/" class="back-btn">← На главную</a>

            <div class="section">
                <h2>📖 Список книг</h2>
                <c:choose>
                    <c:when test="${not empty listBooks}">
                        <table class="books-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Название</th>
                                    <th>Автор</th>
                                    <th>Цена (₽)</th>
                                    <th>Действия</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listBooks}" var="book">
                                    <tr>
                                        <td><strong>#${book.id}</strong></td>
                                        <td>${book.title}</td>
                                        <td>${book.author}</td>
                                        <td><strong>${book.price}</strong></td>
                                        <td>
                                            <a href="/bookdata/${book.id}" class="action-btn view-btn">👁 Просмотр</a>
                                            <a href="/edit/${book.id}" class="action-btn edit-btn">✏️ Редактировать</a>
                                            <a href="/remove/${book.id}" 
                                               class="action-btn delete-btn"
                                               onclick="return confirm('Вы уверены, что хотите удалить книгу «${book.title}»?');">🗑️ Удалить</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <h3>📚 Библиотека пуста</h3>
                            <p>Добавьте свою первую книгу, используя форму ниже</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="section">
                <h2>➕ ${book.id == 0 ? 'Добавить новую книгу' : 'Редактировать книгу'}</h2>
                <div class="form-container">
                    <form action="/books/add" method="post">
                        <input type="hidden" name="id" value="${book.id}">
                        
                        <div class="form-group">
                            <label for="title">📖 Название книги:</label>
                            <input type="text" id="title" name="title" value="${book.title}" required 
                                   placeholder="Введите название книги">
                        </div>
                        
                        <div class="form-group">
                            <label for="author">✍️ Автор:</label>
                            <input type="text" id="author" name="author" value="${book.author}" required 
                                   placeholder="Введите имя автора">
                        </div>
                        
                        <div class="form-group">
                            <label for="price">💰 Цена (₽):</label>
                            <input type="number" id="price" name="price" value="${book.price}" 
                                   step="0.01" min="0" required 
                                   placeholder="Введите цену книги">
                        </div>
                        
                        <button type="submit" class="submit-btn">
                            ${book.id == 0 ? '➕ Добавить книгу' : '💾 Сохранить изменения'}
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Добавляем анимацию при загрузке страницы
        document.addEventListener('DOMContentLoaded', function() {
            const container = document.querySelector('.container');
            container.style.opacity = '0';
            container.style.transform = 'translateY(20px)';
            
            setTimeout(() => {
                container.style.transition = 'all 0.6s ease';
                container.style.opacity = '1';
                container.style.transform = 'translateY(0)';
            }, 100);
        });
    </script>
</body>
</html>
