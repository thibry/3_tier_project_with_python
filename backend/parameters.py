import requests

master_username = "admin"

db_password = "admin123"

endpoint = "app3tier-database.c504uii0sqgj.us-east-1.rds.amazonaws.com"

db_instance_name = "app3tier-database"


if __name__ == "__main__":
    print(master_username, db_password, endpoint, db_instance_name)
