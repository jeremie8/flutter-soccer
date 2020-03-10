class TimeWrapper{
	int content = 0;
	int contentBase;
	TimeWrapper(this.contentBase){
		this.content = contentBase;
	}

	void reset(){
		this.content = contentBase;
	}

	void setContentBase(int contentBase){
		this.contentBase = contentBase;
		if(this.content > contentBase)
			this.content= contentBase;
	}
}