<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Детали книги - ${book.title}</title>
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
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.15);
            overflow: hidden;
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .header {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 40px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }

        .header h1 {
            font-size: 2.8em;
            margin-bottom: 15px;
            text-shadow: 0 3px 6px rgba(0,0,0,0.3);
            position: relative;
            z-index: 1;
        }

        .header p {
            font-size: 1.3em;
            opacity: 0.95;
            position: relative;
            z-index: 1;
        }

        .book-icon {
            font-size: 4em;
            margin-bottom: 20px;
            display: block;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-10px); }
            60% { transform: translateY(-5px); }
        }

        .content {
            padding: 40px;
        }

        .book-details {
            background: linear-gradient(135deg, #f8f9ff 0%, #e3f2fd 100%);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            border: 2px solid #e1f5fe;
            box-shadow: 0 10px 25px rgba(0,0,0,0.05);
        }

        .detail-row {
            display: flex;
            align-items: center;
            margin-bottom: 25px;
            padding: 15px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            transition: transform 0.3s ease;
        }

        .detail-row:hover {
            transform: translateX(5px);
        }

        .detail-row:last-child {
            margin-bottom: 0;
        }

        .detail-icon {
            font-size: 1.5em;
            margin-right: 15px;
            width: 40px;
            text-align: center;
        }

        .detail-label {
            font-weight: 600;
            color: #333;
            font-size: 1.1em;
            min-width: 120px;
            margin-right: 15px;
        }

        .detail-value {
            color: #555;
            font-size: 1.1em;
            flex: 1;
        }

        .price-highlight {
            background: linear-gradient(135deg, #51cf66 0%, #40c057 100%);
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 1.2em;
        }

        .actions {
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .action-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 15px 25px;
            border: none;
            border-radius: 25px;
            text-decoration: none;
            font-size: 1.1em;
            font-weight: 600;
            transition: all 0.3s ease;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .edit-btn {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
        }

        .edit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(79, 172, 254, 0.4);
        }

        .back-btn {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            color: white;
        }

        .back-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(108, 117, 125, 0.4);
        }

        .delete-btn {
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 100%);
            color: white;
        }

        .delete-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(255, 107, 107, 0.4);
        }

        .book-stats {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 15px;
            text-align: center;
            margin-top: 20px;
        }

        .book-stats h3 {
            font-size: 1.3em;
            margin-bottom: 10px;
        }

        .book-stats p {
            opacity: 0.9;
            font-size: 1.1em;
        }

        @media (max-width: 768px) {
            .container {
                margin: 10px;
                border-radius: 15px;
            }
            
            .header {
                padding: 30px 20px;
            }
            
            .header h1 {
                font-size: 2.2em;
            }
            
            .content {
                padding: 25px;
            }
            
            .detail-row {
                flex-direction: column;
                align-items: flex-start;
                text-align: left;
            }
            
            .detail-label {
                min-width: auto;
                margin-bottom: 5px;
            }
            
            .actions {
                flex-direction: column;
            }
            
            .action-btn {
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <span class="book-icon">📖</span>
            <h1>${book.title}</h1>
            <p>Детальная информация о книге</p>
        </div>

        <div class="content">
            <div class="book-details">
                <div class="detail-row">
                    <span class="detail-icon">🆔</span>
                    <span class="detail-label">ID книги:</span>
                    <span class="detail-value"><strong>#${book.id}</strong></span>
                </div>
                
                <div class="detail-row">
                    <span class="detail-icon">📚</span>
                    <span class="detail-label">Название:</span>
                    <span class="detail-value"><strong>${book.title}</strong></span>
                </div>
                
                <div class="detail-row">
                    <span class="detail-icon">✍️</span>
                    <span class="detail-label">Автор:</span>
                    <span class="detail-value"><strong>${book.author}</strong></span>
                </div>
                
                <div class="detail-row">
                    <span class="detail-icon">💰</span>
                    <span class="detail-label">Цена:</span>
                    <span class="detail-value">
                        <span class="price-highlight">${book.price} ₽</span>
                    </span>
                </div>
            </div>

            <div class="actions">
                <a href="/edit/${book.id}" class="action-btn edit-btn">
                    ✏️ Редактировать
                </a>
                <a href="/books" class="action-btn back-btn">
                    📚 К списку книг
                </a>
                <a href="/remove/${book.id}" 
                   class="action-btn delete-btn"
                   onclick="return confirm('Вы уверены, что хотите удалить книгу «${book.title}»?');">
                    🗑️ Удалить
                </a>
            </div>

            <div class="book-stats">
                <h3>📊 Информация о книге</h3>
                <p>Книга добавлена в библиотеку и готова к использованию</p>
            </div>
        </div>
    </div>

    <script>
        // Добавляем интерактивность
        document.addEventListener('DOMContentLoaded', function() {
            const detailRows = document.querySelectorAll('.detail-row');
            
            detailRows.forEach((row, index) => {
                row.style.opacity = '0';
                row.style.transform = 'translateX(-20px)';
                
                setTimeout(() => {
                    row.style.transition = 'all 0.5s ease';
                    row.style.opacity = '1';
                    row.style.transform = 'translateX(0)';
                }, index * 100);
            });
        });
    </script>
</body>
</html>
