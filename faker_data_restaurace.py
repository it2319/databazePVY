import mysql.connector
from faker import Faker
import random
from datetime import datetime, timedelta, time

# Nastavení Fakeru pro české prostředí
fake = Faker('cs_CZ')

# Připojení k databázi - Uprav podle sebe!
db = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="",   # <-- prázdné uvozovky = žádné heslo
    database="restaurace_palyza"
)
cursor = db.cursor()

# Počet záznamů k vygenerování
NUM_STATES = 5
NUM_CITIES = 20
NUM_ADDRESSES = 50
NUM_RESTAURANTS = 10
NUM_TABLES_PER_REST = 15
NUM_OPENING_HOURS_PER_REST = 7  # po jednom na každý den
NUM_CUSTOMERS = 100
NUM_PHONES_PER_CUSTOMER = random.randint(0, 3)  # 0-3 telefony na zákazníka
NUM_RESERVATIONS = 150

# 1. Státy
states = []
for _ in range(NUM_STATES):
    state_name = fake.country()
    cursor.execute("INSERT INTO stat (stat_nazev) VALUES (%s)", (state_name,))
    states.append(cursor.lastrowid)
db.commit()

# 2. Města
cities = []
for _ in range(NUM_CITIES):
    state_id = random.choice(states)
    city_name = fake.city()
    cursor.execute("INSERT INTO mesto (id_stat, mesto_nazev) VALUES (%s, %s)", (state_id, city_name))
    cities.append(cursor.lastrowid)
db.commit()

# 3. Adresy
addresses = []
for _ in range(NUM_ADDRESSES):
    city_id = random.choice(cities)
    street = fake.street_name()
    psc = fake.postcode()
    cursor.execute("INSERT INTO adresa (id_mesto, ulice, psc) VALUES (%s, %s, %s)", (city_id, street, psc))
    addresses.append(cursor.lastrowid)
db.commit()

# 4. Restaurace
restaurants = []
restaurant_names = [fake.company() + " Restaurace" for _ in range(NUM_RESTAURANTS)]
for name in restaurant_names:
    addr_id = random.choice(addresses)
    cursor.execute("INSERT INTO restaurace (nazev, id_adresa) VALUES (%s, %s)", (name, addr_id))
    restaurants.append(cursor.lastrowid)
db.commit()

# 5. Stoly
tables = []
for rest_id in restaurants:
    for i in range(1, NUM_TABLES_PER_REST + 1):
        seats = random.choice([2, 4, 6, 8, 10])
        status = random.choice(['volny', 'rezervovany', 'obsazeny'])
        cursor.execute("""
            INSERT INTO stoly (id_restaurace, cislo_stolu, pocet_mist, stav)
            VALUES (%s, %s, %s, %s)
        """, (rest_id, i, seats, status))
        tables.append(cursor.lastrowid)
db.commit()

# 6. Otevírací doba (pondělí až neděle)
days = ['pondělí', 'úterý', 'středa', 'čtvrtek', 'pátek', 'sobota', 'neděle']
for rest_id in restaurants:
    for day in days:
        if day in ['sobota', 'neděle']:
            # Víkedny kratší nebo zavřeno
            if random.random() < 0.3:
                open_time = None
                close_time = None
            else:
                open_time = time(10, 0)   # 10:00
                close_time = time(22, 0)  # 22:00
        else:
            open_time = time(11, 0)       # 11:00
            close_time = time(23, 0)      # 23:00
        
        cursor.execute("""
            INSERT INTO oteviraci_doba (id_restaurace, den_v_tydnu, otevreno_od, otevreno_do)
            VALUES (%s, %s, %s, %s)
        """, (rest_id, day, open_time, close_time))
db.commit()

# 7. Zákazníci
customers = []
for _ in range(NUM_CUSTOMERS):
    first_name = fake.first_name()
    last_name = fake.last_name()
    email = fake.email()
    addr_id = random.choice(addresses)
    cursor.execute("""
        INSERT INTO zakaznik (jmeno, prijmeni, email, id_adresa)
        VALUES (%s, %s, %s, %s)
    """, (first_name, last_name, email, addr_id))
    customers.append(cursor.lastrowid)
db.commit()

# 8. Telefony (pro zákazníky i restaurace)
for cust_id in customers:
    for _ in range(random.randint(0, 2)):
        phone = fake.phone_number().replace(' ', '').replace('-', '')[:20]
        cursor.execute("INSERT INTO telefon (cislo, id_zakaznik, id_restaurace) VALUES (%s, %s, NULL)", (phone, cust_id))

for rest_id in restaurants:
    phone = fake.phone_number().replace(' ', '').replace('-', '')[:20]
    cursor.execute("INSERT INTO telefon (cislo, id_zakaznik, id_restaurace) VALUES (%s, NULL, %s)", (phone, rest_id))
db.commit()

# 9. Rezervace
for _ in range(NUM_RESERVATIONS):
    table_id = random.choice(tables)
    customer_id = random.choice(customers)
    # Náhodný datum a čas v příštích 3 měsících, v rozumné otevírací době
    start_dt = fake.date_time_between(start_date='now', end_date='+3M')
    # Zaokrouhlit na celé hodiny nebo půlhodiny
    start_dt = start_dt.replace(minute=random.choice([0, 30]), second=0, microsecond=0)
    duration_hours = random.choice([1, 2, 3])
    duration = timedelta(hours=duration_hours)
    persons = random.randint(2, 10)
    note = fake.sentence() if random.random() < 0.3 else None
    
    cursor.execute("""
        INSERT INTO rezervace_stolu (id_stul, id_zakaznik, datum_a_cas, delka_rezervace, pocet_osob, poznamka)
        VALUES (%s, %s, %s, %s, %s, %s)
    """, (table_id, customer_id, start_dt, duration, persons, note))
db.commit()

print("Fake data úspěšně vygenerována a vložena do databáze!")
cursor.close()
db.close()