
# Artzy

An online platform developed in flutter for
- **Artists**: to be able to create an online art gallery where they can add and showcase their artworks.
- **Art Enthusiasts**: to be able to browse for artworks and art galleries.




## Features

- User authentication (firebase)
- Create an art gallery
- Add artworks
- Search artworks
- View galleries
- View artworks
- View profile
- Edit profile


## Installation

### Prerequisites

- Flutter: https://docs.flutter.dev/get-started/install
- Python: https://www.python.org/downloads/
- Firebase connectivity: https://firebase.google.com/docs/flutter/setup?platform=web
- Google chrome
- Internet connection

### Steps
1. Install all the required python libraries using

```bash
  pip3 install -r "requirements.txt"
```

2. Run the following command in the folder frontend

```bash
  flutter pub get
```

3. Create a database in a mysql server by running the script

```bash
  CREATE DATABASE artzy;
```

4. Create all the required tables in the database by running the commands inside backend folder

```bash
  python3 manage.py makemigrations
  python3 manage.py migrate
```

5. Start the django server by running the following command inside backend folder

```bash
  python3 manage.py runserver
```

6. Run the flutter app by running the command inside frontend folder

```bash
  flutter run -d chrome
```

