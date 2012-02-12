///////////////////////////////////////////////////////////////////////////////////////////////////
class Button extends View 
{
	boolean selected = false, flashing = false;
	String t;
	color buttonColor, textColor;
	Integrator fader;  
  
	///////////////////////////////////////////////////////////////////////////////////////////////
	Button(float x_, float y_,float w_,float h_, String t, color buttonColor, color textColor)
	{
		super(x_, y_,w_ ,h_); 
		//   this.selected = selected;
		this.t = t;
		this.buttonColor = buttonColor;
		this.textColor = textColor;
		//   this.flashing = flashing;
		//  fader = new Integrator(100);
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	void drawContent()
	{
		noStroke();
		//   if(flashing)

		fill(0);
		roundrect(-1, -1, (int)w + 2, (int)h + 2, 5);
		
		fill(buttonColor);
		roundrect(0,0,(int)w,(int)h,5);
		fill(textColor);
		text(t,w/2-35,h/2-2);
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	boolean contentPressed(float lx, float ly)
	{
		// override this
		// lx, ly are in the local coordinate system of the view,
		// i.e. 0,0 is the top left corner of this view
		// return false if the click is to "pass through" this view
		selected =!selected;
		System.out.println("Clicked");

		return false;
	}
}
