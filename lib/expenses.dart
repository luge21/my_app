import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  State<Expenses> createState(){
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List <Expense> _registeredExpenses = [
    Expense(
      title: 'Cheeseburger',
      amount: 12.45,
      date: DateTime.now(),
      category: Category.food,
      ),
    Expense(
      title: 'Movie Ticket',
      amount: 18.99,
      date: DateTime.now(),
      category: Category.leisure,
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        Text("Chart"), 
        ExpensesList(expenses: _registeredExpenses)
        ],
      ),
    );
  }
}