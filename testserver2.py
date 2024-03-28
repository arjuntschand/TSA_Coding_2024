#from ssl import _PeerCertRetType
from flask import Flask, request
from flask_sqlalchemy import SQLAlchemy
import base64


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///appDatabase8.db'
db = SQLAlchemy(app)

activitynum = 0
restaurantnum = 0
hotelnum = 0

class Entry(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    base64Val = db.Column(db.String)
    description = db.Column(db.String)
    name = db.Column(db.String)
    
with app.app_context():
    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/sixflags.jpeg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "Experience adrenaline-pumping rides, family-friendly attractions, and live entertainment in Jackson, NJ. Ticket options are available for single-day visits, season passes, and memberships for year-round fun."
            name = "Six Flags Great Adventure"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit()
    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/AdventureAquarium.jpeg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "Encounter over 15,000 aquatic species, interactive exhibits and hands-on activities. Experience one-of-a-kind attractions, including the world’s longest v-shaped Shark Bridge, New Jersey’s longest Shark Tunnel, four Touch Exhibits, and much more!."
            name = "Adventure Aquarium"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit()
    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/sunsetcruise.jpeg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "Enjoy breathtaking sunsets along the Jersey Shore in South Jersey. Prices vary depending on specific locations but range between $20-$40."
            name = "Sunset Cruises on the Jersey Shore"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit()
    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/planetarium.jpeg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "In Jersey City, North Jersey, engage with interactive science exhibits. Ticket prices are generally in the range of $20-$30, perfect for families."
            name = "Liberty Science Center Discovery"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit()
    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/beach.jpg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "In beach towns like Seaside Heights or Cape May, enjoy sunbathing, swimming, and boardwalk activities with daily beach access fees ranging from $7 to $13."
            name = "Beach Day at the Jersey Shore"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit()   
    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/DelawareWaterGap.jpg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "Experience the beauty of the Delaware River with a variety of kayaking trips. The area is in the northwest part of New Jersey, offering stunning views and wildlife sightings. Prices and trip lengths may vary."
            name = "Kayaking at Delaware Water Gap National Recreation Area"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit()   
    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/pinebarrens.jpeg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "Dive into the mystery and natural beauty of this unique ecosystem in South Jersey. Activities vary, from hiking to canoeing, with many free access points."
            name = "The Pine Barrens Adventure"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit()  
    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/edison.jpeg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "Discover the life and inventions of Thomas Edison in his preserved home and laboratory, a fascinating journey into America's industrial past​.Prices range from $10-$15 per person."
            name = "Thomas Edison National Historical Park Exploration"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit()     
    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/turtleback.jpeg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "Meet a diverse range of animals and learn about conservation efforts at one of New Jersey's top family attraction."
            name = "Turtle Back Zoo"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit() 
    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/palisades.jpeg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "Enjoy trails that cater to all levels, offering stunning views and a chance to connect with nature just outside the urban landscape. Explore over 30 miles of scenic paths along the Hudson River, perfect for hiking, biking, and picnicking."
            name = "Palisades Interstate Park"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit()    
  
  
  
    ##############################################################################################################################
    #Dining



    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/pete&eldas.jpeg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "One of the best veteran pizzerias serving thin-crust pies, pasta & sandwiches in a bustling, no-frills setting. Known for their Whole Pie Eater's Club, where diners are challenged to finish an extra-large pie for a chance to win a free t-shirt."
            name = "Pete & Elda's Bar"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit()
    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/feds.jpeg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "Iconic trattoria with a full bar & patio making thin-crust pies & other Italian eats. Federici's has been delighting locals and visitors alike in Downtown Freehold since 1921."
            name = "Federici's Family Restaurant"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit()
    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/luigis.jpeg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "Delicious pizza & Italian dishes in a warm dining space with brightly painted murals and amazing service. Luigi's is celebrated for its welcoming atmosphere and commitment to quality."
            name = "Luigi's Famous Pizza And Catering"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit()
    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/lucas.jpeg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "Tucked away in a strip mall, this cozy Italian stop combines classic dishes with creative twists. Luca’s Ristorante prides itself on using fresh, locally-sourced ingredients to bring the authentic taste of Italy to Somerset, New Jersey."
            name = "Luca’s Ristorante"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit()
    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/brandos.jpeg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "Top-tier osteria serving classic & updated Italian fare in a modern setup with movies playing above the bar. Brando's Citi Cucina is a must-visit for an elevated dining experience in Asbury Park."
            name = "Brando's Citi Cucina"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit()
  

    ##############################################################################################################################
    #Dining


    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/oceanplace.jpeg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "Beachfront Luxury in Long Branch, NJ that exudes a unique and relaxed atmosphere with a touch of modern luxe sophistication. The average nightly stay is around $180."
            name = "Ocean Place Resort & Spa"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit() 
    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/hardrock.jpeg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "Enjoy modern accommodations, world-class entertainment, delicious dining, and enjoyable casino gaming at Hard Rock Hotel & Casino in Atlantic City, NJ. With its beachfront location, this iconic hotel also offers an immersive music memorabilia experience."
            name = "Hard Rock Hotel & Casino"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit() 
    filepath = '/Users/anijain/Documents/GitHub/TSACoding2024/Images/grandhotel.jpeg'
    with open(filepath, 'rb') as f:
            file_data = f.read()
            encoded_data = base64.b64encode(file_data)
            base64image = encoded_data
            description = "Charming hotel near the Cape May beach, featuring on-site restaurant Hemingway's, indoor and outdoor pools, hot tub, and spacious balconies with ocean views. Close to shops and restaurants. The Grand Hotel is close to many famous shops and restaurants."
            name = "The Grand Hotel"
            new_entry = Entry(base64Val=str(base64image), description=description, name=name)
            db.session.add(new_entry)
            db.session.commit() 
with app.app_context():
    db.create_all()

global_entry_counter = 0
@app.route('/attractions', methods=['GET'])
def attractions():
    global global_entry_counter  # Refer to the global counter variable
    entries = Entry.query.all()  # Get all entries from the database
    if global_entry_counter < len(entries):
        entry = entries[global_entry_counter]
        # Determine subcategory counter
        if global_entry_counter < 10:
            counter = global_entry_counter + 1  # Activities, start from 1 to 10
        elif global_entry_counter < 15:
            counter = global_entry_counter - 9  # Dining, reset to start from 1 to 5
        else:
            counter = global_entry_counter - 14  # Lodging, reset to start from 1 to 3

        response_str = f"{entry.base64Val[2:-1]}θ{entry.description}θ{counter}θ{entry.name}"
        global_entry_counter += 1  # Increment the counter to move to the next entry for the next request
        return response_str
    else:
        return "No more entries", 404  # If all entries have been sent



@app.route('/reset_database', methods=['GET'])
def reset_database():
    try:
        # This command deletes all records in all tables
        db.session.query(Entry).delete()
        # Commit the changes to the database
        db.session.commit()
        return "Database reset successfully.", 200
    except Exception as e:
        # If something goes wrong, rollback any changes
        db.session.rollback()
        # Return an error message
        return f"An error occurred: {str(e)}", 500





if __name__ == '__main__':
    # run app in debug mode on port 5000
    app.run(debug=False, host="10.46.68.171", port=5000)

request