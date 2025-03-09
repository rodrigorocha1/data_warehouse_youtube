from dags.src.services.youtube_api import YoutubeAPI

youtube_api = YoutubeAPI()

# for dados in youtube_api.buscar_assunto(assunto='No mans sky', data_publicacao='2025-03-09T14:52:46Z'):
#     print(dados)
#     print()


dados_video = youtube_api.buscar_estatisticas_videos(id_video='zM64SZqM81s')
print(dados_video)
