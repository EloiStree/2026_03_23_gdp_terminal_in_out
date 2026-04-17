class_name TerminalInOutBasicWindow
extends Node


static func open_application_exe(app_name_no_extension: String) -> void:
	OS.execute(app_name_no_extension + ".exe", [], [])

static func open_exe_notepad() -> void:
	OS.execute("notepad.exe", [], [])

static func open_exe_calculator() -> void:
	OS.execute("calc.exe", [], [])

static func open_exe_terminal() -> void:
	OS.execute("cmd.exe", [], [])

static func open_exe_explorer() -> void:
	OS.execute("explorer.exe", [], [])

static func open_exe_vscode() -> void:
	OS.execute("code.exe", [], [])

static func open_exe_powershell() -> void:
	OS.execute("powershell.exe", [], [])

static func open_exe_git_bash() -> void:
	OS.execute("git-bash.exe", [], [])

static func open_exe_control_panel() -> void:
	OS.execute("control.exe", [], [])

static func open_exe_task_manager() -> void:
	OS.execute("taskmgr.exe", [], [])

static func open_exe_file_explorer_at(adb_path) -> void:
	OS.shell_open(adb_path)

#adb -s ZY32KVH2DS  shell monkey -p com.termux/.app.TermuxActivity 1


static func open_exe_terminal_blocking_at(folder_path: String) -> void:
	if OS.get_name() == "Windows":
		OS.execute("cmd.exe", ["/C", "cd /d \"%s\" && start cmd.exe" % folder_path], [])

static func open_exe_terminal_on_side_at(folder_path: String) -> void:
	## did not succed yet to run on side thread
	pass 
	

static func open_exe_folder_in_explorer(folder_path: String) -> void:
	OS.execute("explorer.exe", [folder_path], [])


static func run_exe_python_code_from_absolute_path(python_file_path: String, arguments: Array = []) -> void:
	OS.execute("python.exe", [python_file_path] + arguments, [])


static func run_exe_cmd_array_and_get_output(folder_path: String, command_line_array: Array[String]) -> CommandResult:
	var output = []
	var exit_code = OS.execute("cmd.exe", ["/C", "cd \"" + folder_path + "\" && " + " ".join(command_line_array)], output, false)
	var result = CommandResult.new()
	result.output = output[0] if output.size() > 0 else ""
	result.exit_code = exit_code
	return result

static func run_exe_cmd_and_get_output(folder_path: String, command_line: String) -> CommandResult:
	var output = []
	var exit_code = OS.execute("cmd.exe", ["/C","cd \"" + folder_path + "\" && " + command_line], output, false)
	var result = CommandResult.new()
	result.output = output[0] if output.size() > 0 else ""
	result.exit_code = exit_code
	return result


static func run_exe_cmd_and_get_output_as_array_in_raw_split(folder_path: String,commands:Array[String])->Array[String]:
	var result:Array[String]=[] 
	for c in commands:
		result.append(run_exe_cmd_and_get_output(folder_path,c).output)
	return result

	

class CommandResult:
	var output: String
	var exit_code: int
