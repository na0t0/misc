# Seleniumを使わずに、Edgeを開きYahoo.co.jpにアクセスし「ファイナンス」のハイパーリンクをクリックするPowershellスクリプトを作ってください。

# Edgeを開く
$Edge = New-Object -ComObject Microsoft.Edge.Application
# $Edge.Visible = $true
$Edge.Navigate("https://www.yahoo.co.jp/")

# ページが完全に読み込まれるまで待つ
do {
    Start-Sleep -Milliseconds 500
} until (($Edge.ReadyState -eq 4) -and (-not $Edge.Busy))

# 「ファイナンス」のハイパーリンクをクリックする
$link = $Edge.Document.getElementsByTagName("a") | Where-Object {$_.innerText -eq "ファイナンス"}
$link.Click()
