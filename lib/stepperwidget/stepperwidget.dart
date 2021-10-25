import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  @override
  int currentStep = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper Widget'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Theme(
        data: Theme.of(context)
            .copyWith(colorScheme: ColorScheme.light(primary: Colors.red)),
        child: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          controlsBuilder: (context, {onStepContinue, onStepCancel}) {
            final isLastStep = currentStep == getSteps().length - 1;
            return Container(
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text(isLastStep ? 'Confirm' : 'Next'),
                      onPressed: onStepContinue,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  if (currentStep != 0)
                    Expanded(
                      child: ElevatedButton(
                        child: Text('Back'),
                        onPressed: onStepCancel,
                      ),
                    ),
                ],
              ),
            );
          },
          onStepTapped: (step) {
            setState(() {
              currentStep = step;
            });
          },
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;
            if (isLastStep) {
              print('complete');
            } else {
              setState(() {
                currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (currentStep == 0) {
              print('no');
            } else {
              setState(() {
                currentStep -= 1;
              });
            }
          },
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            content: Container(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'First Name'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                  )
                ],
              ),
            ),
            title: Text('Account')),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            content: Container(
                child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Post Code'),
                )
              ],
            )),
            title: Text('Address')),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            content: Container(),
            title: Text('Complete')),
      ];
}
