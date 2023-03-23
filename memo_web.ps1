
# https://www.tekizai.net/entry/uiautomation_window_minmax

#操作したいウィンドウのタイトル
$MAIN_WINDOW_TITLE="*メモ帳*"
Add-Type -AssemblyName UIAutomationClient
#Get-Processで取得できた1つ目のハンドルを対象とする。
$hwnd=(Get-Process |?{$_.MainWindowTitle -like $MAIN_WINDOW_TITLE})[0].MainWindowHandle
#ハンドルからウィンドウを取得する
$window=[System.Windows.Automation.AutomationElement]::FromHandle($hwnd)
$windowPattern=$window.GetCurrentPattern([System.Windows.Automation.WindowPattern]::Pattern)
#ウィンドウサイズが最大なら最小化し、最小なら最大化する
if ($windowPattern.Current.WindowVisualState -eq [System.Windows.Automation.WindowVisualState]::Maximized)
{
   $windowPattern.SetWindowVisualState([System.Windows.Automation.WindowVisualState]::Minimized)    
}
else
{
   $windowPattern.SetWindowVisualState([System.Windows.Automation.WindowVisualState]::Maximized)
}
