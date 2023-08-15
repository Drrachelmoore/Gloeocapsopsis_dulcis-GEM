# Rachel A Moore 2023-01-06
import cobra

# Load model
model = cobra.io.read_sbml_model('../modelfiles/G._dulcis_model.xml')

print(model.summary())

