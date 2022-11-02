from flask import Flask
from flask import request, send_file
import mysql.connector as sql
import pandas as pd
import numpy as np
#machine
from sklearn.naive_bayes import GaussianNB
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.model_selection import train_test_split
import nltk
from io import BytesIO

#wordcloud
from wordcloud import WordCloud, STOPWORDS
import matplotlib.pyplot as plt

nltk.download('stopwords')
nltk.download('punkt')
stop_words=nltk.corpus.stopwords.words('portuguese') 

db_connection = sql.connect(host='127.0.0.1', database='tcc', user='root', password='bl+;D9g4Vh4P+4')
db_cursor = db_connection.cursor()



app = Flask(__name__)

@app.route("/")

def home():
    return "opa"


@app.route('/analisa_humor')
def analisa_humor():
    idq= request.args.get('idq')
    df = pd.read_csv("frases.csv",
                   encoding='iso8859-1',
                   on_bad_lines='skip',
                   sep=";")
    y = np.array(df["valor"])
    cov = CountVectorizer(lowercase=True)
    X = cov.fit_transform(df.Label).toarray()
    trainx, testx, trainy, testy = train_test_split(X,
                                                    y,
                                                    test_size=0.2,
                                                    random_state=9)
    model = GaussianNB()
    model.fit(trainx, trainy)
    db_cursor.execute('SELECT resp FROM questionario where idquest={id} '.format(id=idq))
    table_rows = db_cursor.fetchall()
    dfdb = pd.DataFrame(table_rows) 
    data = cov.transform([str(dfdb[0])]).toarray()
    saida = model.predict(data)
    print (saida)
    return str(saida)

@app.route('/wordcloud')
#def limpar_txt(text):
  ##text = text.lower()
  #stemmer = nltk.SnowballStemmer("portuguese")
  #return " ".join([stemmer.stem(w) for w in text])


def wordcloud():
    idpac= request.args.get('idpac')
    db_cursor.execute('SELECT resp FROM questionario where idpac={id} '.format(id=idpac))
    table_rows = db_cursor.fetchall()
    df = pd.DataFrame(table_rows) 
    summary = df.dropna(subset=[0], axis=0)[0]
    all_summary = " ".join(s for s in summary)
    #df[0] = df[0]..apply(limpar_txt)
    stop_words = nltk.corpus.stopwords.words('portuguese')
    wordcloud = WordCloud(stopwords=stop_words,
                        background_color="black",
                        width=1000,
                        height=800).generate(all_summary)
    fig, ax = plt.subplots(figsize=(20, 15))
    ax.imshow(wordcloud, interpolation='bilinear')
    ax.set_axis_off()

    plt.savefig('wordcloud.png')
    return send_file('wordcloud.png')

    
@app.route('/graf_tarefas')
def graf_tarefas():
    idpac= request.args.get('idpac')
    db_cursor.execute('select dia, humor from tarefas where idpac={id} '.format(id=idpac))
    table_rows = db_cursor.fetchall()
    df = pd.DataFrame(table_rows) 
    df[0] = pd.to_datetime(df[0],
                            dayfirst=True).dt.strftime('%d/%m')
    a = df.pivot_table(index=[0], values=[1], aggfunc='mean')
    graf = a.plot.area()
    plt.xlabel("Humor")
    plt.ylabel("Dias")
    plt.savefig('graf.png')
    return send_file('graf.png')


if __name__=="__main__":
    app.run(debug=True)