import logging
import pandas as pd
import re
import requests
import os
import os.path
from bs4 import BeautifulSoup



logger = logging.getLogger('data_extraction.py')


def done(client, params):
	"""
	Return True if the node is up-to-date else False.
	"""
	#logger.info('Checking if extraction node is up-to-date.')

	return os.path.isfile(params.raw_data)

def update(client, params):
	#logger.info('Updating extraction node.')
	#file = params.url
	#logger.info(f'Accessing URL {file}.')

	#logger.debug('Status code: ', response.status_code)
	


	response = requests.get(params.url)
	soup = BeautifulSoup(response.content,'lxml')
	movie_names = [movie.find('a')['title'].replace('Filme ','') for movie in soup.find_all('div', attrs={'class':'col-sm-6 col-md-3'})]
	movie_links = ['https://www.cinemark.com.br/' + movie.find('a')['href'] for movie in soup.find_all('div', attrs={'class':'col-sm-6 col-md-3'})]

	classificacao = []
	trailers = []
	duracao = []

	# run through the movies and get some info from it.
	df = pd.DataFrame()
	for link in movie_links:
		response = requests.get(params.url)
		soup = BeautifulSoup(response.content,'lxml')
		try:
			classificacao.append(soup.find('div', attrs={'class':'movie-details'}).find_all('span')[1].text)
			trailers.append(soup.find('div', attrs={'class':'movie-details'}).find_all('li')[1].find('a')['href'].replace('//','https://'))
		except:
			classificacao.append(0)
			trailers.append(0)
	if len(classificacao)!=len(movie_names):
		classificacao=classificacao[0:len(movie_names)]

	df = pd.concat([df, pd.DataFrame({'name': movie_names,'trailers': trailers,})])

	df.to_csv(params.raw_data,index=False)


	#logger.info(f'Reading to dataframe.')

	#logger.debug('Dataframe size: ', df.shape)
	#logger.debug('The resulting dataframe: ', df.head())

	#logger.info(f'Storing at {params.path}.')
	
	#df.to_csv(path)




