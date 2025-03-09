from typing import Any, Dict, Generator
from googleapiclient.discovery import build
from dotenv import load_dotenv
import os
load_dotenv()


class YoutubeAPI:
    def __init__(self):
        self.__CHAVE = os.environ['CHAVE_API']
        self.__youtube = build('youtube', 'v3', developerKey=self.__CHAVE)

    def buscar_assunto(self, assunto: str, data_publicacao: str) -> Generator[Dict[str, Any], None, None]:
        """Método para buscar o assunto

        Args:
            assunto (str): assunto do vídeo
            data_publicacao (str): data de públicação

        Yields:
            Generator[Dict[str, Any], None, None]: Gerador com os vídeos
        """
        next_page_token = None
        while True:
            request = self.__youtube.search().list(
                part='snippet',
                q=assunto,
                publishedAfter=data_publicacao,  # Formato ISO 8601
                order='date',
                pageToken=next_page_token

            )

            response = request.execute()

            yield from response['items']
            next_page_token = response['nextPageToken']
            print(next_page_token)
            if not next_page_token:
                break
