from telethon.sync import TelegramClient
import sys
api_id = 1054981
api_hash = '341e29114e1bb38d1fda9f1a22b59b28'
file = sys.argv[1]
print(type(file))
print(file)
with TelegramClient('group', api_id, api_hash) as client:
   def callback(current, total):
      print('Uploaded', current, 'out of', total,'bytes: {:.2%}'.format(current / total))
   client.send_file('hk_dramas_chat',file,force_document=True,progress_callback=callback)
