# import dotenv
import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# dotenv.read_dotenv(os.path.join(os.path.dirname(__file__), ".env"))


# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'p9ci6pjjt%!0i^z5ant&2l3q&s-v%_fh&5e@(sia%ww4gchi@m'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ["gokcztcjnpbwqdayynonxpamromhuzaa6p55xcew7jzj2jv2cwqadfqd.onion", "127.0.0.1", "*"]


# Application definition
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    # Third Party
    'django_celery_results',
    'widget_tweaks',
    'captcha',
    'django_countries',
    'star_ratings',

    # My APPS
    'accounts.apps.AccountsConfig',
    'cart.apps.CartConfig',
    'main.apps.MainConfig',
    'orders.apps.OrdersConfig',
    'support.apps.SupportConfig',
    'vendorpanel',
    'vendor'
]


AUTH_USER_MODEL = 'accounts.User'

# Password validation
AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'dark_web.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'cart.context_proccessors.cart',
            ],
        },
    },
]

# TEMPLATE_DIRS = (
#     os.path.join(BASE_DIR, 'templates'),
# )

# TEMPLATE_DIRS = (BASE_DIR, 'templates')

# os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

WSGI_APPLICATION = 'dark_web.wsgi.application'
MESSAGE_STORAGE = 'django.contrib.messages.storage.cookie.CookieStorage'
MESSAGE_LEVEL = 5
# Database
# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.mysql',
#         'NAME': 'dark_web',
#         'USER': 'vaibhav',
#         'PASSWORD': 'vaibhav@123',
#         'HOST': 'localhost',   # Or an IP Address that your DB is hosted on
#         'PORT': '3306',
#     }
# }
# DATABASE_USER = os.environ.get("DATABASE_USER", "tormkt")
# DATABASE_PASSWORD = os.environ.get("DATABASE_PASSWORD", "cevemado")
# DATABASE_HOSTNAME = os.environ.get("DATABASE_HOSTNAME", "127.0.0.1")
# DATABASE_PORT = os.environ.get("DATABASE_PORT", "3306")
# DATABASE_NAME = os.environ.get("DATABASE_NAME", "tor_marketplace")

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': "tor_marketplace",
        'USER': "tormkt",
        'PASSWORD': "cevemado",
        'HOST': "127.0.0.1",   # Or an IP Address that your DB is hosted on
        'PORT': "3306",
    }
}

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.mysql',
#         'NAME': "tor_marketplace",
#         'USER': "root",
#         'PASSWORD': "",
#         'HOST': "127.0.0.1",   # Or an IP Address that your DB is hosted on
#         'PORT': "3306",
#     }
# }

# Internationalization
LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'UTC'
USE_I18N = True
USE_L10N = True
USE_TZ = True


# Static files (CSS, JavaScript, Images)
PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))
STATIC_ROOT = os.path.join(PROJECT_ROOT, 'static')
STATIC_URL = '/static/'
STATICFILES_DIRS = [os.path.join(BASE_DIR, 'static'), ]

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media/')


CART_SESSION_ID = 'cart'

LOGIN_URL = '/signin'
LOGIN_REDIRECT_URL = '/'
LOGOUT_REDIRECT_URL = '/'

CELERY_RESULT_BACKEND = 'django-db'
