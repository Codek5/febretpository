///////////////////////////////////////////////////////////////////////////////////////////////////
class GraphPopUpView extends View 
{
	float arrowX, arrowY;
	SecondLevelRowView parent;
	ClosePopUpView close;

	///////////////////////////////////////////////////////////////////////////////////////////////
	GraphPopUpView(float w_, SecondLevelRowView parent)
	{
		super(0, 0,w_ ,0);
		close = new ClosePopUpView(0,0,w,20);
		this.subviews.add(close);
		this.parent = parent;
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	void reset(PImage img)
	{
		PopUpSection title = new PopUpSection(0, 0, null, "");
		title.setImage(img);
		title.w = w;
		subviews.add(title);
	}

	///////////////////////////////////////////////////////////////////////////////////////////////
	void layout()
	{
		h = 0;
		for(int i = 0; i < subviews.size();i++)
		{
			View w = (View)popUpView.subviews.get(i);
			w.y = h;
			h += w.h;
		}
	}

	///////////////////////////////////////////////////////////////////////////////////////////////
	void drawContent()
	{
		int border = 5;
		fill(0, 0, 0, 180);
		noStroke();
		rect(-border, -border, w + border, h + border);
		triangle(-border, 10, arrowX - x, arrowY - y, -border, h - 10);
		fill(255);
		rect(0, 0, w, h);
	}
}
