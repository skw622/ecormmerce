#apt-get update && #apt-get upgrade
#apt-get install cron
#systemctl status cron
#nano /etc/crontab

# */5 * * * * /path/to/script-or-program


import os
from cryptowatch_client import Client

if __name__ == '__main__':
    os.environ.setdefault('DJANGO_SETTINGS_MODULE',
                          'dark_web.settings')

    import django
    django.setup()

    from main.models import BTCPrice

    client = Client(timeout=30)
    btcgbp = client.get_markets_price(exchange='gdax', pair='btcgbp')
    btcusd = client.get_markets_price(exchange='gdax', pair='btcusd')
    btceur = client.get_markets_price(exchange='gdax', pair='btceur')
    btcgbp_response = btcgbp.json()
    btcusd_response = btcusd.json()
    btceur_response = btceur.json()
    btcgbpPrice=btcgbp_response.get('result').get('price')
    btcusdPrice=btcusd_response.get('result').get('price')
    btceurPrice=btceur_response.get('result').get('price')

    BTCPrice.objects.create(
        btcgbp=btcgbpPrice,
        btcusd=btcusdPrice,
        btceur=btceurPrice
    )
