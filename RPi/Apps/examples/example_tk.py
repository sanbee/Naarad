import tkinter as tk

# Create the main window
root = tk.Tk()
root.title("Widget Example")
root.geometry("400x300") # Set initial window size

# Label Widget: Displays static text
label = tk.Label(root, text="Hello, Tkinter Widgets!")
label.pack(pady=10) # Add some padding

# Entry Widget: Allows single-line text input
entry_label = tk.Label(root, text="Enter your name:")
entry_label.pack()
entry = tk.Entry(root, width=30)
entry.pack(pady=5)

# Button Widget: Performs an action when clicked
def on_button_click():
    name = entry.get()
    if name:
        output_label.config(text=f"Hello, {name}!")
    else:
        output_label.config(text="Please enter your name!")

button = tk.Button(root, text="Greet Me!", command=on_button_click)
button.pack(pady=10)

# Output Label: Displays dynamic text based on interaction
output_label = tk.Label(root, text="")
output_label.pack()

# Checkbutton Widget: Allows a boolean choice
check_var = tk.IntVar() # Variable to store the state (0 or 1)
checkbox = tk.Checkbutton(root, text="Agree to terms", variable=check_var)
checkbox.pack(pady=5)

# Run the Tkinter event loop
root.mainloop()
