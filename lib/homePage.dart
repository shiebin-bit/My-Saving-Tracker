import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String frequency = 'Weekly';
  TextEditingController targetAmountController = TextEditingController();
  TextEditingController startingBalanceController = TextEditingController();
  TextEditingController savingAmountController = TextEditingController();
  String resultText = '';

  FocusNode targetAmountFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page', style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightBlue, width: 2.0),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                width: 400.0,
                height: 700.0,
                child: Column(
                  children: [
                    Text(
                      'Welcome to the My Saving Tracker!',
                      style: TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        SizedBox(width: 80.0, child: Text('Target Amount:')),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            focusNode: FocusNode(),
                            controller: targetAmountController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter your target amount',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        SizedBox(width: 80.0, child: Text('Starting Balance:')),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            focusNode: FocusNode(),
                            controller: startingBalanceController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter your starting balance',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        SizedBox(width: 80.0, child: Text('Saving amount:')),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            focusNode: FocusNode(),
                            controller: savingAmountController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter the amount to save',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        SizedBox(width: 100, child: Text('Frequency:')),
                        DropdownButton<String>(
                          value: frequency,
                          items: <String>['Weekly', 'Monthly'].map((
                            String value,
                          ) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            frequency = newValue!;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            calculateSavingDuration(frequency);
                          },
                          child: Text('Calculate Duration'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            targetAmountController.clear();
                            startingBalanceController.clear();
                            savingAmountController.clear();

                            setState(() {
                              frequency = 'Weekly';
                              resultText = ' ';
                            });
                            FocusScope.of(
                              context,
                            ).requestFocus(targetAmountFocus);
                            targetAmountFocus.requestFocus();
                          },
                          child: Text('Reset'),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      width: 400.0,
                      height: 250.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Time to reach goal:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black54,
                            ),
                          ),

                          const SizedBox(height: 8),
                          Expanded(
                            child: Center(
                              child: Text(
                                resultText,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateSavingDuration(String selectedFrequency) {
    double targetAmount = double.tryParse(targetAmountController.text) ?? 0.0;
    double startingBalance =
        double.tryParse(startingBalanceController.text) ?? 0.0;
    double savingAmount = double.tryParse(savingAmountController.text) ?? 0.0;

    if (savingAmount <= 0) {
      setState(() {
        resultText = 'Saving amount must be greater than zero.';
      });
      return;
    }

    if (targetAmount <= 0) {
      setState(() {
        resultText = 'Target amount must be greater than zero.';
      });
      return;
    }

    if (targetAmount <= startingBalance) {
      setState(() {
        resultText = 'Goal already reached!';
      });
      return;
    }

    double calculatedResult = (targetAmount - startingBalance) / savingAmount;

    String unitLabel;
    if (selectedFrequency == 'Weekly') {
      unitLabel = 'weeks';
    } else {
      unitLabel = 'months';
    }

    setState(() {
      resultText = '$calculatedResult $unitLabel';
    });
  }
}
