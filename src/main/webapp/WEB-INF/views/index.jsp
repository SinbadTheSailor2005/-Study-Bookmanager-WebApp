<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Библиотека книг - Главная</title>
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
            overflow-x: hidden;
        }

        .hero-section {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            position: relative;
            overflow: hidden;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><radialGradient id="a" cx="50%" cy="50%"><stop offset="0%" stop-color="%23ffffff" stop-opacity="0.1"/><stop offset="100%" stop-color="%23ffffff" stop-opacity="0"/></radialGradient></defs><circle cx="200" cy="200" r="100" fill="url(%23a)"/><circle cx="800" cy="300" r="150" fill="url(%23a)"/><circle cx="400" cy="700" r="120" fill="url(%23a)"/><circle cx="900" cy="800" r="80" fill="url(%23a)"/></svg>') no-repeat center center;
            background-size: cover;
            animation: float 20s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }

        .hero-content {
            position: relative;
            z-index: 2;
            max-width: 800px;
            padding: 0 20px;
        }

        .hero-icon {
            font-size: 6em;
            margin-bottom: 30px;
            display: block;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-20px); }
            60% { transform: translateY(-10px); }
        }

        .hero-title {
            font-size: 4em;
            margin-bottom: 20px;
            text-shadow: 0 4px 8px rgba(0,0,0,0.3);
            animation: slideInDown 1s ease-out;
        }

        @keyframes slideInDown {
            from {
                opacity: 0;
                transform: translateY(-50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .hero-subtitle {
            font-size: 1.5em;
            margin-bottom: 40px;
            opacity: 0.9;
            animation: slideInUp 1s ease-out 0.3s both;
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .cta-buttons {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
            animation: slideInUp 1s ease-out 0.6s both;
        }

        .cta-btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 20px 40px;
            border: none;
            border-radius: 30px;
            text-decoration: none;
            font-size: 1.2em;
            font-weight: 600;
            transition: all 0.3s ease;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
        }

        .cta-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s;
        }

        .cta-btn:hover::before {
            left: 100%;
        }

        .primary-btn {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            box-shadow: 0 10px 30px rgba(79, 172, 254, 0.3);
        }

        .primary-btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(79, 172, 254, 0.4);
        }

        .secondary-btn {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: 2px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(10px);
        }

        .secondary-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(255, 255, 255, 0.2);
        }

        .features-section {
            padding: 80px 20px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
        }

        .features-container {
            max-width: 1200px;
            margin: 0 auto;
            text-align: center;
        }

        .features-title {
            font-size: 2.5em;
            color: white;
            margin-bottom: 20px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }

        .features-subtitle {
            font-size: 1.2em;
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 60px;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .feature-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px 30px;
            text-align: center;
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-10px);
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }

        .feature-icon {
            font-size: 3em;
            margin-bottom: 20px;
            display: block;
        }

        .feature-title {
            font-size: 1.5em;
            margin-bottom: 15px;
            font-weight: 600;
        }

        .feature-description {
            font-size: 1.1em;
            opacity: 0.9;
            line-height: 1.6;
        }

        .footer {
            text-align: center;
            padding: 40px 20px;
            color: rgba(255, 255, 255, 0.8);
            font-size: 1.1em;
        }

        .footer p {
            margin-bottom: 10px;
        }

        .footer a {
            color: white;
            text-decoration: none;
            font-weight: 600;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5em;
            }
            
            .hero-subtitle {
                font-size: 1.2em;
            }
            
            .cta-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .cta-btn {
                width: 100%;
                max-width: 300px;
                justify-content: center;
            }
            
            .features-title {
                font-size: 2em;
            }
            
            .features-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .hero-title {
                font-size: 2em;
            }
            
            .hero-icon {
                font-size: 4em;
            }
            
            .cta-btn {
                padding: 15px 30px;
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
    <div class="hero-section">
        <div class="hero-content">
            <span class="hero-icon">📚</span>
            <h1 class="hero-title">Добро пожаловать в Библиотеку</h1>
            <p class="hero-subtitle">Управляйте своей коллекцией книг с легкостью и стилем</p>
            <div class="cta-buttons">
                <a href="/books" class="cta-btn primary-btn">
                    📖 Управление книгами
                </a>
                <a href="#features" class="cta-btn secondary-btn">
                    ✨ Возможности
                </a>
            </div>
        </div>
    </div>

    <div class="features-section" id="features">
        <div class="features-container">
            <h2 class="features-title">Возможности системы</h2>
            <p class="features-subtitle">Все необходимое для управления вашей библиотекой</p>
            
            <div class="features-grid">
                <div class="feature-card">
                    <span class="feature-icon">📚</span>
                    <h3 class="feature-title">Просмотр книг</h3>
                    <p class="feature-description">
                        Просматривайте полный список ваших книг с удобной таблицей и поиском
                    </p>
                </div>
                
                <div class="feature-card">
                    <span class="feature-icon">➕</span>
                    <h3 class="feature-title">Добавление книг</h3>
                    <p class="feature-description">
                        Легко добавляйте новые книги с информацией о названии, авторе и цене
                    </p>
                </div>
                
                <div class="feature-card">
                    <span class="feature-icon">✏️</span>
                    <h3 class="feature-title">Редактирование</h3>
                    <p class="feature-description">
                        Изменяйте информацию о книгах одним кликом с интуитивным интерфейсом
                    </p>
                </div>
                
                <div class="feature-card">
                    <span class="feature-icon">🗑️</span>
                    <h3 class="feature-title">Удаление</h3>
                    <p class="feature-description">
                        Безопасно удаляйте ненужные книги с подтверждением действия
                    </p>
                </div>
                
                <div class="feature-card">
                    <span class="feature-icon">👁️</span>
                    <h3 class="feature-title">Детальный просмотр</h3>
                    <p class="feature-description">
                        Просматривайте подробную информацию о каждой книге отдельно
                    </p>
                </div>
                
                <div class="feature-card">
                    <span class="feature-icon">💾</span>
                    <h3 class="feature-title">Сохранение данных</h3>
                    <p class="feature-description">
                        Все ваши данные надежно сохраняются в базе данных
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>Создано с ❤️ для управления библиотекой</p>
        <p>Используйте <a href="/books">систему управления книгами</a> для начала работы</p>
    </div>

    <script>
        // Плавная прокрутка к секции возможностей
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });

        // Анимация появления карточек при прокрутке
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, observerOptions);

        // Применяем анимацию к карточкам
        document.addEventListener('DOMContentLoaded', function() {
            const featureCards = document.querySelectorAll('.feature-card');
            featureCards.forEach(card => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(30px)';
                card.style.transition = 'all 0.6s ease';
                observer.observe(card);
            });
        });
    </script>
</body>
</html>