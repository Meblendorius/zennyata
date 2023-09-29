Zennyata-
Python code for a Flask web application that performs sentiment analysis, generates word clouds, and creates mood trend visualizations. This repository consists of a single Python file named app.py. The application uses various libraries and a MySQL database to provide these functionalities.


1. Introduction <a name="introduction"></a>
This GitHub repository contains a Flask web application that provides the following functionalities:

Sentiment analysis of text data.
Generation of word clouds based on provided text data.
Visualization of mood trends over time.
The application uses a MySQL database to store and retrieve text data for analysis and visualization. It also utilizes various Python libraries, including Flask, scikit-learn, pandas, nltk, and wordcloud, to perform these tasks.

2. Dependencies <a name="dependencies"></a>
To run this application, you need the following dependencies:

Flask
MySQL Connector
pandas
numpy
scikit-learn
nltk
wordcloud
matplotlib
You can install these dependencies using pip:

pip install Flask mysql-connector-python pandas numpy scikit-learn nltk wordcloud matplotlib
3. Usage <a name="usage"></a>
To use this application, follow these steps:

Ensure that you have all the dependencies installed (see Dependencies).

Set up a MySQL database with the necessary tables and data. You can refer to the code in the app.py file to understand the database schema.

Clone this GitHub repository to your local machine:


git clone https://github.com/your-username/your-repo.git
Navigate to the repository directory:

cd your-repo
Edit the database connection details in the app.py file to match your MySQL database configuration:
python
db_connection = sql.connect(host='your-host', database='your-database', user='your-username', password='your-password')
Run the Flask application:
python app.py
The application should now be running locally.

4. Routes <a name="routes"></a>
The application has the following routes:

Home <a name="home"></a>
URL: /
Description: A simple home route that returns "opa" as a response.
Analyze Humor <a name="analyze-humor"></a>
URL: /analisa_humor
Description: Performs sentiment analysis on text data. It takes a parameter idq to retrieve text data from the database, analyzes it, and returns the sentiment prediction.
Generate Word Cloud <a name="generate-word-cloud"></a>
URL: /wordcloud
Description: Generates a word cloud based on text data from the database. It takes a parameter idpac to retrieve text data, preprocesses it, and creates a word cloud image. The image is then sent as a response.
Generate Mood Trend Visualization <a name="generate-mood-trend-visualization"></a>
URL: /graf_tarefas
Description: Generates a mood trend visualization based on data from the database. It takes a parameter idpac to retrieve mood data, aggregates it, and creates an area plot of mood trends over time. The plot image is then sent as a response.
5. Running the Application <a name="running-the-application"></a>
To run the application, follow the steps in the Usage section. Make sure you have set up the database and provided the correct connection details in the app.py file.
