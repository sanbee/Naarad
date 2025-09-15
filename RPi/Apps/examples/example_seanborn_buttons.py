import seaborn as sns
import matplotlib.pyplot as plt
from matplotlib.widgets import Button

# Load a sample dataset
data = sns.load_dataset("iris")

# Create a Seaborn plot
fig, ax = plt.subplots()
sns.scatterplot(x="sepal_length", y="sepal_width", hue="species", data=data, ax=ax)
ax.set_title("Iris Sepal Length vs. Width")

# Define a function to be called when the button is clicked
def on_button_click(event):
    print("Button clicked!")
    # You can add logic here to modify the plot, update data, etc.
    # For example, change the title
    ax.set_title("Button Clicked: Iris Sepal Length vs. Width")
    fig.canvas.draw_idle() # Redraw the canvas

# Create a button widget
button_ax = plt.axes([0.7, 0.05, 0.1, 0.075]) # [left, bottom, width, height]
button = Button(button_ax, 'Click Me')

# Register the button click event handler
button.on_clicked(on_button_click)

plt.show()
