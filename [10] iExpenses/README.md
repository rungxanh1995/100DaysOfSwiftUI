#  iExpense

## About
An personal finance app to let users log their expenses of different types (i.e. personal, business, school) and currencies (USD, CAD, EUR, etc.).

This project was a tutorial project from [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) course by [Paul Hudson](https://twitter.com/twostraws).

## Functionality Extensions 👨‍💻
I developed extra features beyond the scope of its original tutorial with due research, code refactoring and critical problem-solving skills.
<table>
	<thead>
		<tr>
			<th>Feature</th>
			<th>Details</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Lists of Expense Types</td>
			<td>
			The main view is split into sections of different expense types, and create/delete operations work accordingly
			</td>
		</tr>
		<tr>
			<td>Expense Currencies</td>
			<td>Allow a preset number of currencies to be used. It's easy to add more currencies with an edit in the `ExpenseCurrency` enum.</td>
		</tr>
		<tr>
			<td>Expense Notes</td>
			<td>Allow users to add additional notes to an expense.</td>
		</tr>
		<tr>
			<td>Autosizing Text Field</td>
			<td>
				Researched and implemented an autoresizing textfield for expense notes (original author of this code credited in source file).
			</td>
		</tr>
		<tr>
			<td>Different Expense Colors</td>
			<td>The more amount an expense is, the brighter in color it is shown. Teal for expenses under 10, orange for under 100, and red for anything above.</td>
		</tr>
	</tbody>
</table>


## Concept Extensions
Implementation of extra concepts beyond the scope of its original tutorial were made to this project, including:
<table>
	<thead>
		<tr>
			<th>Concept</th>
			<th>Details</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Model-View-ViewModel</td>
			<td>Proactively researched and implemented MVVM architecture in this app</td>
		</tr>
		<tr>
			<td>Code Organization</td>
			<td>Neatly break up code & organizaze into different modules to ensure SRP principle</td>
		</tr>
		<tr>
			<td>Localization</td>
			<td>Support multiple localized app content, currently English and Vietnamese</td>
		</tr>
	</tbody>
</table>

## Screenshot
![Screenshot](screenshots/screenshot.jpg)