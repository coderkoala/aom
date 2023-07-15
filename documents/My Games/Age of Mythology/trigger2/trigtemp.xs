//==============================================================================
// TEST TRIGGER SCRIPT
//==============================================================================


void main(void)
{
   trEventSetHandler(3,  "eventHandler");
   trEventSetHandler(0,  "eventHandler");
   trEventSetHandler(1,  "eventHandler");
   trEventSetHandler(2,  "eventHandler");
}

void eventHandler(int eventID=-1)
{
   switch(eventID)
   {
   case 3:
   {
      xsEnableRule("_Unit_01");
      trEcho("Trigger enabling rule Unit_01");
      break;
   }
   case 0:
   {
      xsEnableRule("_Unit_02");
      trEcho("Trigger enabling rule Unit_02");
      break;
   }
   case 1:
   {
      xsEnableRule("_Unit_03");
      trEcho("Trigger enabling rule Unit_03");
      break;
   }
   case 2:
   {
      xsEnableRule("_Unit_04");
      trEcho("Trigger enabling rule Unit_04");
      break;
   }
   }
}

rule _Camera
minInterval 4
active
runImmediately
{
   bool bVar0 = (true);


   bool tempExp = (bVar0);
   if (tempExp)
   {
      trCameraCut(vector(-4.038571,75.572708,-5.061412), vector(0.500000,-0.707107,0.500000), vector(0.500000,0.707107,0.500000), vector(0.707107,0.000000,-0.707107));
      trSetObscuredUnits(false);
      xsDisableRule("_Camera");
      trEcho("Trigger disabling rule Camera");
   }
}

rule _Unit_01
highFrequency
inactive
{
   bool bVar0 = ((trTime()-cActivationTime) >= 5);


   bool tempExp = (bVar0);
   if (tempExp)
   {
      trUnitSelectClear();
      trUnitSelectByID(161);
      trUnitSelectByID(42);
      trUnitSelectByID(61);
      trUnitSelectByID(158);
      trUnitSelectByID(159);
      trUnitSelectByID(160);
      trUnitSelectByID(163);
      trUnitSelectByID(167);
      trUnitSelectByID(162);
      trUnitSelectByID(164);
      trUnitSelectByID(165);
      trUnitSelectByID(166);
      trUnitSelectByID(168);
      trUnitSelectByID(169);
      trUnitSelectByID(171);
      trUnitSelectByID(170);
      trUnitMoveToUnit("4755",0, false);
      xsDisableRule("_Unit_01");
      trEcho("Trigger disabling rule Unit_01");
   }
}

rule _Unit_02
highFrequency
inactive
{
   bool bVar0 = ((trTime()-cActivationTime) >= 5);


   bool tempExp = (bVar0);
   if (tempExp)
   {
      trUnitSelectClear();
      trUnitSelectByID(161);
      trUnitSelectByID(42);
      trUnitSelectByID(61);
      trUnitSelectByID(158);
      trUnitSelectByID(159);
      trUnitSelectByID(160);
      trUnitSelectByID(163);
      trUnitSelectByID(167);
      trUnitSelectByID(162);
      trUnitSelectByID(164);
      trUnitSelectByID(165);
      trUnitSelectByID(166);
      trUnitSelectByID(168);
      trUnitSelectByID(169);
      trUnitSelectByID(171);
      trUnitSelectByID(170);
      trUnitMoveToUnit("4762",1, false);
      xsDisableRule("_Unit_02");
      trEcho("Trigger disabling rule Unit_02");
   }
}

rule _Unit_03
highFrequency
inactive
{
   bool bVar0 = ((trTime()-cActivationTime) >= 5);


   bool tempExp = (bVar0);
   if (tempExp)
   {
      trUnitSelectClear();
      trUnitSelectByID(161);
      trUnitSelectByID(42);
      trUnitSelectByID(61);
      trUnitSelectByID(158);
      trUnitSelectByID(159);
      trUnitSelectByID(160);
      trUnitSelectByID(163);
      trUnitSelectByID(167);
      trUnitSelectByID(162);
      trUnitSelectByID(164);
      trUnitSelectByID(165);
      trUnitSelectByID(166);
      trUnitSelectByID(168);
      trUnitSelectByID(169);
      trUnitSelectByID(171);
      trUnitSelectByID(170);
      trUnitMoveToUnit("4763",2, false);
      xsDisableRule("_Unit_03");
      trEcho("Trigger disabling rule Unit_03");
   }
}

rule _Unit_04
highFrequency
inactive
{
   bool bVar0 = ((trTime()-cActivationTime) >= 5);


   bool tempExp = (bVar0);
   if (tempExp)
   {
      trUnitSelectClear();
      trUnitSelectByID(161);
      trUnitSelectByID(42);
      trUnitSelectByID(61);
      trUnitSelectByID(158);
      trUnitSelectByID(159);
      trUnitSelectByID(160);
      trUnitSelectByID(163);
      trUnitSelectByID(167);
      trUnitSelectByID(162);
      trUnitSelectByID(164);
      trUnitSelectByID(165);
      trUnitSelectByID(166);
      trUnitSelectByID(168);
      trUnitSelectByID(169);
      trUnitSelectByID(171);
      trUnitSelectByID(170);
      trUnitMoveToUnit("4765",3, false);
      xsDisableRule("_Unit_04");
      trEcho("Trigger disabling rule Unit_04");
   }
}

rule _Kick
highFrequency
active
{
   bool bVar0 = ((trTime()-cActivationTime) >= 2);


   bool tempExp = (bVar0);
   if (tempExp)
   {
      trEventFire(3);
      xsDisableRule("_Kick");
      trEcho("Trigger disabling rule Kick");
   }
}

rule _Techs
minInterval 4
active
runImmediately
{
   bool bVar0 = (true);


   bool tempExp = (bVar0);
   if (tempExp)
   {
      trTechSetStatus(1, 17, 4);
      trTechSetStatus(1, 20, 4);
      trTechSetStatus(1, 14, 4);
      trTechSetStatus(1, 8, 4);
      trTechSetStatus(1, 5, 4);
      trTechSetStatus(1, 394, 0);
      xsDisableRule("_Techs");
      trEcho("Trigger disabling rule Techs");
   }
}

