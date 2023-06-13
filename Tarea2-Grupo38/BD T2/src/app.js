import express from 'express';
import morgan from 'morgan';
import PersonajesController from './controllers/PersonajesController.js';
import KartsController from './controllers/KartsController.js';
import TrabajosController from './controllers/TrabajosController.js';
import ReinosController from './controllers/ReinosController.js';
import DefensasController from './controllers/DefensasController.js';
import Personaje_tiene_trabajoController from './controllers/Personaje_tiene_trabajo.js';
import DiplomaciasController from './controllers/Diplomacias.js';
import Personaje_habita_reinoController from './controllers/Personaje_habita_reino.js';
import Defensas_en_reinosController from './controllers/Defensas_en_reinos.js';

const ENV = process.env;
const app = express();

//middleware
app.use(express.json());
app.use(morgan('dev'));

//CRUD ===============
//Personajes
app.post('/api/Personajes', PersonajesController.createPersonaje)
app.get('/api/Personajes', PersonajesController.getPersonajes)
app.get('/api/Personajes/:id', PersonajesController.getPersonajeById)
app.delete('/api/Personajes/:id', PersonajesController.deletePersonaje)
app.put('/api/Personajes/:id', PersonajesController.updatePersonaje)

//Karts
app.post('/api/Karts', KartsController.createKart)
app.get('/api/Karts', KartsController.getKarts)
app.get('/api/Karts/:id', KartsController.getKartById)
app.delete('/api/Karts/:id', KartsController.deleteKart)
app.put('/api/Karts/:id', KartsController.updateKart)

//Personaje_tiene_trabajo
app.post('/api/Personaje_tiene_trabajo', Personaje_tiene_trabajoController.createPersonaje_tiene_trabajo)
app.get('/api/Personaje_tiene_trabajo', Personaje_tiene_trabajoController.getPersonajes_tienen_trabajo)
app.get('/api/Personaje_tiene_trabajo/:id_trabajo/:id_personaje', Personaje_tiene_trabajoController.getPersonaje_tiene_trabajoById)
app.delete('/api/Personaje_tiene_trabajo/:id_trabajo/:id_personaje', Personaje_tiene_trabajoController.deletePersonaje_tiene_trabajo)
app.put('/api/Personaje_tiene_trabajo/:id_trabajo/:id_personaje', Personaje_tiene_trabajoController.updatePersonaje_tiene_trabajo)

//Trabajos
app.post('/api/Trabajos', TrabajosController.createTrabajo)
app.get('/api/Trabajos', TrabajosController.getTrabajos)
app.get('/api/Trabajos/:id', TrabajosController.getTrabajoById)
app.delete('/api/Trabajos/:id', TrabajosController.deleteTrabajo)
app.put('/api/Trabajos/:id', TrabajosController.updateTrabajo)

//Reinos
app.post('/api/Reinos', ReinosController.createReino)
app.get('/api/reinos', ReinosController.getReinos)
app.get('/api/Reinos/:id', ReinosController.getReinoById)
app.delete('/api/Reinos/:id', ReinosController.deleteReino)
app.put('/api/Reinos/:id', ReinosController.updateReino)

//Defensas
app.post('/api/Defensas', DefensasController.createDefensa)
app.get('/api/Defensas', DefensasController.getDefensas)
app.get('/api/Defensas/:id', DefensasController.getDefensaById)
app.delete('/api/Defensas/:id', DefensasController.deleteDefensa)
app.put('/api/Defensas/:id', DefensasController.updateDefensa)

//Defensas_en_reino
app.post('/api/Defensas_en_reinos', Defensas_en_reinosController.createDefensa_en_reino)
app.get('/api/Defensas_en_reinos', Defensas_en_reinosController.getDefensas_en_reinos)
app.get('/api/Defensas_en_reinos/:id_reino/:id_defensa', Defensas_en_reinosController.getDefensa_en_reinoById)
app.delete('/api/Defensas_en_reinos/:id_reino/:id_defensa', Defensas_en_reinosController.deleteDefensa_en_reino)
app.put('/api/Defensas_en_reinos/:id_reino/:id_defensa', Defensas_en_reinosController.updateDefensa_en_reino)

//Diplomacias
app.post('/api/Diplomacias', DiplomaciasController.createDiplomacia)
app.get('/api/Diplomacias', DiplomaciasController.getDiplomacias)
app.get('/api/Diplomacias/:id_reino_1/:id_reino_2', DiplomaciasController.getDiplomaciaById)
app.delete('/api/Diplomacias/:id_reino_1/:id_reino_2', DiplomaciasController.deleteDiplomacia)
app.put('/api/Diplomacias/:id_reino_1/:id_reino_2', DiplomaciasController.updateDiplomacia)

//Personaje_habita_reino
app.post('/api/Personaje_habita_reino', Personaje_habita_reinoController.createPersonaje_habita_reino)
app.get('/api/Personaje_habita_reino', Personaje_habita_reinoController.getPersonajes_habitan_reino)
app.get('/api/Personaje_habita_reino/:id_personaje/:id_reino', Personaje_habita_reinoController.getPersonaje_habita_reinoById)
app.delete('/api/Personaje_habita_reino/:id_personaje/:id_reino', Personaje_habita_reinoController.deletePersonaje_habita_reino)
app.put('/api/Personaje_habita_reino/:id_personaje/:id_reino', Personaje_habita_reinoController.updatePersonaje_habita_reino)

//====================

//endpoints===========

app.get('/api/top5personajesConMasFuerza', PersonajesController.top5Personajes)
app.get('/api/personajeConMasKarts', PersonajesController.personajeConMasKarts)
app.get('/api/cantidadHabitantes/:id_reino', Personaje_habita_reinoController.cantidadHabitantes)
app.get('/api/gobernante', Personaje_habita_reinoController.gobernantes)
app.get('/api/gobernante/:id_reino', Personaje_habita_reinoController.gobernantesById)

//==========================================================//

app.get('/', (req, res) => {
    res.json({ message: 'Hello World!!' });
})

//==========================================================//


// 404 not found route
app.use((_, res) => {
    res.status(404).json({ message: 'Not found Crack!' });
})


//Init server
app.listen(ENV.API_PORT, () => {
    console.log(`Server running on port ${ENV.API_PORT}`);
})
