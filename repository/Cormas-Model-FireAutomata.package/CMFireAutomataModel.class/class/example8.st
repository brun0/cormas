examples
example8
	"Example used in OpenMole (https://openmole.org/)"
    | conf aModel |
	 "self createInJSONFile." "OpenMole usually generate this file"
    conf := CMOpenMoleExchange loadJSONFile: 'input.json'.
    aModel := self newWithProgrammableScenario
        numberOfFires: (conf at: #numberOfFires) ;
        numberOfFiremen: (conf at: #numberOfFiremen);
        percentageOfTrees: (conf at: #percentageOfTrees);
        dimensions: (conf at: #dimensionMin) -> (conf at: #dimensionMax);
        activeControl: #step:;
        initSimulation.
    aModel simManager
        initializeSimulation;
        finalTime: 100;
        runSimulation.
	Transcript open.
	Transcript show: ((aModel data at: #CMFireAutomataModel) at: #nbTrees) last.
   CMOpenMoleExchange saveJSONFile: (aModel data) last.	