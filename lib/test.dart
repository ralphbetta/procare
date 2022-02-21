import 'package:flutter/material.dart';


class StepperScreen extends StatefulWidget {
  const StepperScreen({Key? key}) : super(key: key);

  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  // the current step
  int _currentStep = 0;

  // Determines whether the stepper's orientation is vertical or horizontal
  // This variable can be changed by using the switch below
  bool _isVerticalStepper = true;

  // This function will be triggered when a step is tapped
  _stepTapped(int step) {
    setState(() => _currentStep = step);
  }

  // This function will be called when the continue button is tapped
  _stepContinue() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  // This function will be called when the cancel button is tapped
  _stepCancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KindaCode.com'),
      ),
      body: Column(
        children: [
          // Controls the stepper orientation
          SwitchListTile(
              title: const Text('Vertical Stepper?'),
              subtitle: const Text('vertical/horizontal direction'),
              value: _isVerticalStepper,
              onChanged: (_) {
                setState(() {
                  _isVerticalStepper = !_isVerticalStepper;
                });
              }),
          const Divider(
            thickness: 2,
            height: 30,
          ),

          Expanded(
            // the Stepper widget
            child: Stepper(
              // vertical or horizontial
              type: _isVerticalStepper
                  ? StepperType.vertical
                  : StepperType.horizontal,
              physics: const ScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (step) => _stepTapped(step),
              onStepContinue: _stepContinue,
              onStepCancel: _stepCancel,
              steps: [
                // The first step: Name
                Step(
                  title: const Text('Name'),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration:
                        const InputDecoration(labelText: 'Your name'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                // The second step: Phone number
                Step(
                  title: const Text('Phone'),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'You mobile number'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
                // The third step: Verify phone number
                Step(
                  title: const Text('Verify'),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Verification code'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}