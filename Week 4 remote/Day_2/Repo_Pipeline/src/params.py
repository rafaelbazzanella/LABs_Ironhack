
#local onde ficam os parametros para os outros arquivos

from pandas import DataFrame
from datetime import datetime

class Params:
	"""
	Parameters class.

	This file centralizes anything that can be 
	parametrized in the code.
	"""

	raw_data = f"../data/raw/raw_{datetime.today().strftime('%Y-%m-%d')}.csv"
	external_data = '../data/external/'
	processed_data = '../data/processed/'
	intermediate_data = f"../data/intermediate/intermediate_{datetime.today().strftime('%Y-%m-%d')}.csv"

	log_name = '../log/dump.log'

	# if this is set to True, then all the nodes will be automatically 
	# considered not up-to-date and will be rerun.
	rerun = True 

	## Database connection params
	user = ''
	password = ''
	host = 'localhost'
	database = 'cinemark'

	#info specific for webscrapping
	url = f'https://www.cinemark.com.br/sao-paulo/filmes/em-cartaz'