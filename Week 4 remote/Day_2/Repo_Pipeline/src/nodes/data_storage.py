import logging
import pandas as pd
from datetime import datetime

logger = logging.getLogger('nodes.data_storage')


def update(client, params):
	df=pd.read_csv(params.intermediate_data)
	df.to_sql('movies', client.conn, index=False, if_exists='append')
	logger.info(f"Results stored for {datetime.today().strftime('%Y-%m-%d')}")

def done(client, params):
	#method1 log:  do not use: ler arquivo do log e usar regex
	#method 2: verificar se esta na base de dados
	return False