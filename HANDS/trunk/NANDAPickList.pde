class NANDAPickList extends NativeActionsPopUpView
{
	////////////////////////////////////////////////////////////////////////////
	NANDAPickList(POCManager poc)
	{
		super(510, poc);

        PopUpSection actions = addSection("Add NANDA");
        actions.addNANDA("Acute Pain", "acutePain.png");
        actions.addNANDA("Complicated Grieving", "complicatedGrieving.png");
        actions.addNANDA("Compromised Family Coping", "compromisedFamilyCoping.png");
        actions.addNANDA("Constipation", "tooltipPlaceholder.PNG");
        actions.addNANDA("Death Anxiety", "deathAnxiety.png");
        actions.addNANDA("Dysfunctional Family Processes", "dysfunctionalFamilyProcesses.png");
        actions.addNANDA("Impaired Gas Exchange", "impairedgasExchange.png");
        actions.addNANDA("Impaired Physical Mobility", "impairedPhysicalMobility.PNG");
        actions.addNANDA("Impaired Skin Integrity", "impairedSkinIntegrity.png");
        actions.addNANDA("Nausea", "Nausea.png");
        actions.addNANDA("Readiness for Family Coping", "readinessForFamilyCoping.png");
        actions.addNANDA("Caregiver Support", "tooltipPlaceholder.PNG");
	}
}
