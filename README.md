
# collaboration

#My Folder Structure breakdown
My folders are split into different folder to have a clean architechture that can be maintainable or scalable.I have different folders for screen,widgets,utils and state management.

#State Management
I implemented Change Notifier Provider.This was instantiated at the root of the app.The CartModel class extends a ChangeNotifier.This is chosen for a small app to share data across screens in the app.The buttons use the provider and listen is set to false.

#Architecture 
The model was provided with a mock data since there is no backend service.The UI layers received data from the model created and the controller used is the Change NOtifier
