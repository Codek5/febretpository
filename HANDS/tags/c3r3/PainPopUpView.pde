///////////////////////////////////////////////////////////////////////////////////////////////////
class PainPopUpView extends PopUpViewBase
{
	int ADD_NIC = 0;
	int ADD_NOC = 1;
	int REMOVE_NANDA = 2;
	int PRIORITIZE_NANDA = 3;
	
	Button descriptionButton;
	
	int totalActions;
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	PainPopUpView(int w_, SecondLevelRowView parent)
	{
		super(w_, parent);
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	void setupPainTitleSection()
	{
		// PopUpSection title = new PopUpSection("<h1> Mrs. Taylor's Pain Level is not controlled");
		// String alertDescription = MSG_PAIN_EVIDENCE_POPUP;
		
		// if(OPTION_ENABLE_POPUP_TEXT)
		// {
			// if(OPTION_GRAPH_ALERT_BUTTON)
			// {
				// descriptionButton = new Button(
					// 322, 75, 0, 20, "Action required!", alertHighColor, 0);
				// descriptionButton.tooltipText = alertDescription;
				// descriptionButton.blinking = true;
				// title.subviews.add(descriptionButton);
			// }
			// else
			// {
				// //title.setDescription(alertDescription);
			// }
			// title.separatorStyle = 1;
			// if(OPTION_EXPANDABLE_POPUP_TEXT) title.enableExpandableDescription();
			// // v2.1: graph has info button (we hack the infobutton from popup section)
			// if(OPTION_GRAPH_IN_MAIN_POPUP)
			// {
				// title.setImage(painLevelTrend);
				// title.setInfoButton(MSG_PAIN_GRAPH_DESCRIPTION);
			// }
		// }
		
		if(OPTION_BIG_INFORMATION)
		{
			PopUpSection title = new PopUpSection("");
			title.setImage(painLevelTrend);
			title.setInfoButton(MSG_PAIN_GRAPH_DESCRIPTION);
			subviews.add(title);
		}
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	void setupPainActionSections()
	{
		// v2.1: on option 2 we do not use the star icon.
		// String positioningText = "Positioning <b> (Recommended) </b> <s1>";
		// if(OPTION_NUMBER == 2)
		// {
			// positioningText = "Positioning <b> (Recommended) </b>";
		// }
		
		CheckBox c = new CheckBox("Add NIC: Positioning", "Positioning", thirdLevelIcon, ADD_NIC);
		c.setIconTooltipImage(IMG_POSITIONING);
		// if(OPTION_ENABLE_ACTION_INFO_POPUP)
		// {
			// c.setInfoButton("Analysis of similar patient's data shows: <l> \n " +
							// "A combination of Medication Management, Positioning and Pain Management has most positive impact on Pain Level.\n");
		// }
		CheckBox c1 = new CheckBox("Prioritize NANDA: Acute Pain", firstLevelIcon, PRIORITIZE_NANDA);
		CheckBox c2 = new CheckBox("Remove NANDA: Impaired Gas Exchange", firstLevelIcon, REMOVE_NANDA);
		//CheckBox c3 = new CheckBox("Energy Conservation", secondLevelIcon, ADD_NOC);
		//CheckBox c4 = new CheckBox("Coping", secondLevelIcon, ADD_NOC);
		CheckBox c5 = new CheckBox("Add NIC: Patient controlled analgesia", thirdLevelIcon, ADD_NIC);
		CheckBox c6 = new CheckBox("Add NIC: Massage", thirdLevelIcon, ADD_NIC);
		CheckBox c7 = new CheckBox("Add NIC: Relaxation Therapy", thirdLevelIcon, ADD_NIC);
		CheckBox c8 = new CheckBox("Add NIC: Guided Imagery", thirdLevelIcon, ADD_NIC);
		
		c1.setIconTooltipImage(IMG_ACUTE_PAIN);
		c2.setIconTooltipImage(IMG_IMPAIRED_GAS_EXCHANGE);
		//c3.setIconTooltipImage(IMG_ENERGY_CONSERVATION);
		//c4.setIconTooltipImage(IMG_COPING);
		c5.setIconTooltipImage(IMG_PATIENT_CONTROLLED_ANALGESIA);
		c6.setIconTooltipImage(IMG_MASSAGE);
		c7.setIconTooltipImage(IMG_RELAXATION_THERAPY);
		c8.setIconTooltipImage(IMG_GUIDED_IMAGERY);
		
		// Big information: we present EBI side-by-side with actions
		if(OPTION_BIG_INFORMATION)
		{
			PopUpSection section1 = new PopUpSection(
				OPTION_TAILORED_MESSAGES ? MSG_PAIN_POSITIONING_TAILORED : MSG_PAIN_POSITIONING);
			//section1.setDescription(MSG_PAIN_POSITIONING);
			section1.addAction(c);
			
			
			PopUpSection section2 = new PopUpSection(
				OPTION_TAILORED_MESSAGES ? MSG_PAIN_GAS_EXCHANGE_TAILORED : MSG_PAIN_GAS_EXCHANGE);
			//section2.setDescription(MSG_PAIN_GAS_EXCHANGE);
			section2.addAction(c1);
			section2.addAction(c2);
			
			PopUpSection section3 = new PopUpSection(
				OPTION_TAILORED_MESSAGES ? MSG_PAIN_OUTCOME_TAILORED : MSG_PAIN_OUTCOME);
			//section3.setDescription(MSG_PAIN_OUTCOME);
			section3.addAction(c5);
			section3.addAction(c6);
			section3.addAction(c7);
			section3.addAction(c8);
			
			subviews.add(section1);
			subviews.add(section2);
			subviews.add(section3);
		}
		// Little information: just list actions
		else
		{
			PopUpSection section1 = new PopUpSection("Recommended Actions");
			section1.addAction(c);
			section1.addAction(c1);
			section1.addAction(c2);
			section1.addAction(c5);
			section1.addAction(c6);
			section1.addAction(c7);
			section1.addAction(c8);
			
			subviews.add(section1);
		}
		totalActions = 7;
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	void reset()
	{
		setupPainTitleSection();
		setupPainActionSections();
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	void onOkClicked()
	{
		parent.stopBlinking();		
		for(int i = 0; i < subviews.size(); i++)
		{
			View v = (View)subviews.get(i);
			if(v != commit && v != notApplicable && v != close)
			{
				PopUpSection pps = (PopUpSection)v;
				ArrayList toRemove = new ArrayList();
				if(pps.actionBoxes != null) 
				{
					for(int j = 0; j < pps.actionBoxes.size(); j++)
					{
						CheckBox c = pps.actionBoxes.get(j);
						if(c.selected)
						{
							toRemove.add(c);
							if(c.id == ADD_NIC)
							{
  
                                                    String[] tags = c.tag.split(": ");
                                                     if(tags.length > 1)
								pocManager.addNIC(tags[1], c.tb.text, parent, c.iconButton.tooltipImage);
                                                                else
								pocManager.addNIC(c.tag, c.tb.text, parent, c.iconButton.tooltipImage);
							}
							if(c.id == ADD_NOC)
							{
                                                      String[] tags = c.tag.split(": ");
                                                     if(tags.length > 1)
                                                     
                                                     pocManager.addNOC(tags[1], c.tb.text, parent.parent, c.iconButton.tooltipImage);
                                                     else
                                                     
								pocManager.addNOC(c.tag, c.tb.text, parent.parent, c.iconButton.tooltipImage);
							}
							if(c.id == REMOVE_NANDA)
							{
								pocManager.deleteNANDA(pocManager.impairedGasExchange);
								if(c.tb.text.length() != 0) pocManager.impairedGasExchange.addComment(c.tb.text);
							}
							if(c.id == PRIORITIZE_NANDA)
							{
								pocManager.prioritizeNANDA(parent.parent);
								if(c.tb.text.length() != 0) parent.parent.addComment(c.tb.text);
							}
						}
					}
				}
				// Remove checked items after a commit.
				for(int j = 0; j < toRemove.size(); j++)
				{
					v.subviews.remove(toRemove.get(j));
					pps.actionBoxes.remove(toRemove.get(j));
					totalActions--;
				}
			}
		}
		mainView.subviews.remove(this);
		popUpView = null;
		
		print(totalActions);
		
		// If all possible actions have been added, remove popup.
		if(totalActions == 0)
		{
			parent.removeAlertButton();
		}
	}
}