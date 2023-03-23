# UI Automationのアセンブリを読み込む
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Windows.Automation

# メモ帳を起動する
Start-Process notepad

# メモ帳のウィンドウが開くまで待つ
Start-Sleep -Seconds 2

# メモ帳のウィンドウを取得する
$notepad = Get-Process | Where-Object {$_.MainWindowTitle -like "*Notepad*"}

# メモ帳のテキストボックスを取得する
$textbox = $notepad | Get-UIAControl -Name "テキスト入力エリア"

# テキストを入力する
$textbox.ValuePattern.SetValue("Hello, world!")

# メモ帳を閉じる
$notepad.CloseMainWindow()
