import os
from quart import Quart, Response, make_response, render_template, request, websocket
import asyncio
from uuid import uuid4
import traceback
import random
from dotenv import load_dotenv
from pytz import timezone
import time
import logging

load_dotenv()

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

app = Quart(__name__)

@app.route('/')
async def home():

    res = {
        'status': 'OK',
    }

    return res

if __name__ == '__main__':
    app.run(
        host="0.0.0.0",
        port=5555,
        reload=True
    )
