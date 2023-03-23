# Seleniumを使わずに、Edgeを開きYahoo.co.jpにアクセスし「ファイナンス」のハイパーリンクをクリックするPythonスクリプトを作ってください

import webbrowser
import time

# Yahoo.co.jpにアクセスする
url = "https://www.yahoo.co.jp"
webbrowser.open_new(url)

# ページが完全に読み込まれるまで待機する
time.sleep(5)

# ページ内の「ファイナンス」リンクをクリックする
finance_link_text = "ファイナンス"
for link in webbrowser.get().find_elements_by_partial_link_text(finance_link_text):
    if link.text == finance_link_text:
        link.click()
        break


# このスクリプトでは、webbrowserモジュールのopen_new関数を使用して、Yahoo.co.jpにアクセスします。次に、timeモジュールのsleep関数を使用して、ページが完全に読み込まれるのを待ちます。最後に、find_elements_by_partial_link_textメソッドを使用して、ページ内の「ファイナンス」リンクを検索し、それをクリックします。なお、この方法