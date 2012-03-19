///////////////////////////////////////////////////////////////////////////////////////////////////
class CheckBox extends View 
{
	boolean selected;
	StaticText text;
	TextBox tb;
	Button iconButton;
	Button infoButton;
	float tw;
	
	int id;
	String tag;

	int checkX = 4;
	int checkY = 4;
	int checkW = 12;
	int checkH = 12;
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	CheckBox(String t, PImage icon1, int id)
	{
		super(0, 0,250,20); 
		this.id = id;
		selected = false;
		this.tag = t;
		text = new StaticText(t);
		subviews.add(text);
		
		if(icon1 != null)
		{
			iconButton = new Button(25, 2, 22, 22, icon1);
			subviews.add(iconButton);
		}
		
		this.selected = selected;
		tb = new TextBox(20,30);
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	CheckBox(String t, String tag, PImage icon1, int id)
	{
		super(0, 0,250,20); 
		this.id = id;
		selected = false;
		this.tag = tag;
		text = new StaticText(t);
		subviews.add(text);
		
		if(icon1 != null)
		{
			iconButton = new Button(25, 2, 22, 22, icon1);
			subviews.add(iconButton);
		}
		
		this.selected = selected;
		tb = new TextBox(20,30);
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	void setInfoButton(String text)
	{
		infoButton = new Button(0, 0, 22, 22, infoIcon);
		infoButton.tooltipText = text;
		subviews.add(infoButton);
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	void setIconTooltip(String text)
	{
		if(iconButton != null)
		{
			iconButton.tooltipText = text;
		}
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	void layout()
	{
		if(infoButton != null)
		{
			infoButton.x = text.maxTextWidth + text.x + 10;
		}
		w = popUpView.w;
		tb.x = tw + 50;
		tb.w = popUpView.w - tw - 70;
		tb.y = 0;
		
		text.x = 50;
		text.y = 2;
		text.w = w;
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	void drawContent()
	{
		textAlign(LEFT,CENTER);
		
		color checkColor = #333333;

		checkX = 4;
		checkY = 4;
		checkW = 12;
		checkH = 12;
	
		gu.drawBox(checkX, checkY, checkW, checkH, 1, 0, 255);
		gu.drawBox(checkX, checkY, checkW, checkH, 2, 0, 60);
		if(selected)
		{
			checkX += 4;
			checkY += 4;
			checkW -= 8;
			checkH -= 8;
			gu.drawBox(checkX, checkY, checkW, checkH, 1, checkColor, 180);
			fill(checkColor, 255);
			rect(checkX, checkY, checkX + checkW, checkY + checkH + 1);
		}
		
		fill(0);
	}
  
	///////////////////////////////////////////////////////////////////////////////////////////////
	boolean contentClicked(float lx, float ly)
	{
		int margin = 4;
		if(lx > checkX - margin && lx < checkX + checkW + margin &&
			ly > checkY - margin && ly < checkY + checkH + margin)
		{
			selected =!selected;
			tb.activated = false;
			System.out.println("Selected = "+ selected);
			if(selected)
			{
				this.subviews.add(tb);
				//this.h = 60; 
			} 
			else	
			{
				this.subviews.remove(tb);
				//this.h = 20; 
			}
		}
		return true;
	}

}

