class CheckBox extends View {


  boolean iconUsed, selected, icon2Used;
  String t;
  PImage icon1, icon2;
  CheckBox(float x_, float y_,boolean iconUsed,boolean icon2Used,boolean selected, String t, PImage icon1, PImage icon2)
  {
    super(x_, y_,250,20); 
    this.selected = selected;
    this.t = t;
    this.iconUsed = iconUsed;
    this.icon2Used = icon2Used;
    if(iconUsed)
      this.icon1 = icon1;
      
    if(icon2Used)
     this.icon2 = icon2;
    
  }
  void drawContent()
  {
    
    
    strokeWeight(3);
    stroke(0);
    if(selected)
    fill(0);
   // rect(0,0,w,h);
   else
   fill(popUpSectionColor);
   
   rect(5,1.65,23,16);
   if(iconUsed)
    image(icon1,30,2);
    
   if(icon2Used)
    image(icon2,48,2);
 
 fill(0);
 
 textSize(16);
    text(t, 70, 8);
    
    textSize(12);
  }
    boolean contentPressed(float lx, float ly)
  {
    // override this
    // lx, ly are in the local coordinate system of the view,
    // i.e. 0,0 is the top left corner of this view
    // return false if the click is to "pass through" this view
   selected =!selected;
   
    return true;
  }

}
