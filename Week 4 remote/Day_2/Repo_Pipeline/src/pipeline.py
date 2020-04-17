

# temos que chamar os arquivos para achar as funções e tb para rodar as funções

from nodes import data_extraction
from nodes import data_transform
from nodes import data_storage
from nodes import data_viz
from nodes import data_preparation

from params import Params 
from client import Client
import logging

import pandas as pd


def process(client, params):  
	"""
	The ETL pipeline.

	It contains the main nodes of the extract-transform-load 
	pipeline from the process. 

	apenas definindo quem deve rodar para fazer as verificações no pipeline
	"""
	data_preparation.run(client, params)

	if not data_extraction.done(client, params):
		data_extraction.update(client, params)

	if not data_transform.done(client, params):
		data_transform.update(client, params)

	if not data_storage.done(client, params): 
		data_storage.update(client, params)

	#if not data_viz.done(client, params):
	#	data_viz.update(client, params)

if __name__ == '__main__': 

	params = Params()
	client = Client(params)

	logging.basicConfig(filename=params.log_name,
						level=logging.INFO,
						format='%(asctime)s.%(msecs)03d %(levelname)s %(module)s - %(funcName)s: %(message)s',
    					datefmt='%Y-%m-%d %H:%M:%S')
	
	process(client, params)