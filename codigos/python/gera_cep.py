import pandas as pd
import geopy
from geopy.geocoders import Nominatim
import argparse
import unidecode
import time

def location_points(geo, lat, long, indice):
    print(str(indice)+': '+str(lat)+', '+str(long))
    location = geolocator.reverse(str(lat)+', '+str(long))
    location_json = location.raw
    try:
        new_field_bairro = location_json['address']['neighbourhood']
    except KeyError:
        try:
            new_field_bairro = location_json['address']['suburb']
        except KeyError:
            try:
                new_field_bairro = location_json['address']['residential']
            except KeyError:
                try:
                    new_field_bairro = location_json['address']['city_district']
                except KeyError:
                    new_field_bairro = 'N/I'
    try:
        new_field_logradouro = location_json['address']['road']
    except KeyError:
        new_field_logradouro = 'N/I'
    return unidecode.unidecode(new_field_bairro)+' // '+unidecode.unidecode(new_field_logradouro)

parser = argparse.ArgumentParser()
parser.add_argument('--intervalo')
args = parser.parse_args()
intervalo = int(args.intervalo)

df_clientes = pd.read_csv(r'C:\Users\lfbas\Downloads\olist_customers_dataset.csv')
df_geolocation = pd.read_csv(r'C:\Users\lfbas\Downloads\olist_geolocation_dataset.csv')
df_final = pd.merge(df_clientes, df_geolocation, how='left', left_on=['customer_zip_code_prefix'], right_on=['geolocation_zip_code_prefix'], sort=False)
df_final = df_final[['customer_id', 'customer_unique_id', 'customer_zip_code_prefix', 'customer_city', 'customer_state', 'geolocation_lat', 'geolocation_lng']]
df_final = df_final.dropna(subset=['geolocation_lat'])
df_final = df_final.drop_duplicates(['customer_id']).sort_values(by=['customer_id']).reset_index(drop=True)
for x in range(0, df_final.tail(1).index.item(), intervalo):
    df_pedaco = None
    inicio = x
    if x + intervalo > df_final.tail(1).index.item():
        fim = df_final.tail(1).index.item()
    else:
        fim = x + intervalo
    df_pedaco = df_final.iloc[inicio:fim]
    geolocator = Nominatim(user_agent="Chrome/99.0.4844.84")
    df_pedaco['bairro_logradouro'] = df_pedaco.apply(lambda x: location_points(geolocator, x.geolocation_lat, x.geolocation_lng, x.name), axis=1)
    df_pedaco = df_pedaco[['customer_zip_code_prefix', 'geolocation_lat', 'geolocation_lng', 'bairro_logradouro']]
    df_pedaco.columns = ['cep_prefixo', 'latitude', 'longitude', 'bairro_logradouro']

    with open(r'C:\Users\lfbas\Downloads\lista_enderecos_python.csv', 'a') as f:
        df_pedaco.to_csv(f, header=f.tell()==0, index=False)

    time.sleep(300)
