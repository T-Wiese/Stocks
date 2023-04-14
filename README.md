Stock App

This app will let you view a portfolio of stocks. It should automatically load, if not an option to retry
will be shown. The list is refreshable by scrolling, and will display a loading indicator.  

I used an MVVM architecture, which is better suited to a react framework like SwiftUI. 

I removed the network call and parsing for the View Model (Stock Manager) into a separate class (StockFetcher).
This makes it clear of the view model's purpose, as well as to let the view model manage threads itself. 
Since we're using a syncronous API to load data we let the view model call it on an async thread. We could also
replace the fetcher easily, assuming it follows the same protocols, which we could also add, but decided wasn't 
necessary for a small project. 
