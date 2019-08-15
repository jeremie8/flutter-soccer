class TimeUtils{
	static String formatTime(int timeInSecs){
		String pre = timeInSecs < 0 ? "-" : "";
		timeInSecs = timeInSecs < 0 ? timeInSecs * -1 : timeInSecs;

		int secs = timeInSecs % 60;
		String secsPre = secs < 10 ? "0" : "";

		int mins = timeInSecs ~/ 60;
		int hours = mins ~/ 60;
		String strHours = "";

		if(hours > 0){
			mins = mins % 60;
			strHours = "$hours:";
		}

		String minsPre = mins < 10 && hours > 0 ? "0" : "";

		return "$pre$strHours$minsPre$mins:$secsPre$secs";
	}
}