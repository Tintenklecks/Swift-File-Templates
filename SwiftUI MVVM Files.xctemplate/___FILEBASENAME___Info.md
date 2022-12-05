# How to use this template

1. This template generates a bunch of files for you. You can use it to create a new user story. It encapsulates the ViewModel (___FILEBASENAME___ViewModel.swift) and the Model (___FILEBASENAME___Model.swift) inside of the SwiftUI View structure **___VARIABLE_className___View** as an extension
    extension ___VARIABLE_className___View {
        class ViewModel: ObservableObject {
            // ViewModel code

2. The Enpoints are encapsulated inside an enum ___VARIABLE_className___EndPoints which contains all endpoints and a rule/variable to create the url and the mockUrl for testing

3. In the ___FILEBASENAME___Service.swift file you find the representatives of a service that applies to the  DataServiceProtocol and inherits from the GenericDataService. 

4. The dummy data in posts.json can be mapped to the struct in ___FILEBASENAME___ .DummyDataStructure.swift

5. In the ___FILEBASENAME___.Misc.swift file you find global code, that you only need once. So if you create a second story with this template, you can just delete this file to the new story.

## How to deal with the second instance of a story


1. Use a class name and file prefix that is different ;-)
2. In the case of this story, delete
   - ___FILEBASENAME___.Misc.swift
   - ___FILEBASENAME___.DummyDataStructure.swift
  and everything should work fine



## Have fun ... life's shorter than you think
That's it. Have fun with this template. If you have any questions, just ask me (ingo@puco.de).