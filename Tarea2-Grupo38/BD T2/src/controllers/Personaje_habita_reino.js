import prisma from '../prismaClient.js'

const getPersonajes_habitan_reino = async (req , res) => {
    try{
        const personajes_habitan_reino = await prisma.personaje_habita_reino.findMany()
        res.json(personajes_habitan_reino)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener todos los registros de personajes que habitan reinos' })
    }
}

const getPersonaje_habita_reinoById = async (req, res) => {
    try {
        const { id_personaje, id_reino } = req.params
        const personaje_habita_reino = await prisma.personaje_habita_reino.findFirst({
            where: { id_personaje: Number(id_personaje), id_reino: Number(id_reino) }
        })
        res.json(personaje_habita_reino)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener por id el registro de personaje habita reino' })
    }
}

const createPersonaje_habita_reino = async (req, res) => {
    try {
        const { id_personaje, id_reino, fecha_registro, es_gobernante } = req.body
        const newPersonaje_habita_reino = await prisma.personaje_habita_reino.create({
            data: { id_personaje, id_reino, fecha_registro, es_gobernante }
        })
        res.json(newPersonaje_habita_reino)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al crear registro de personaje habita reino' })
    }
}

const updatePersonaje_habita_reino = async (req, res) => {
    try {
        const { id_personaje, id_reino } = req.params
        const { fecha_registro, es_gobernante } = req.body
        const updatedPersonaje_habita_reino = await prisma.personaje_habita_reino.updateMany({
            where: { id_personaje: Number(id_personaje), id_reino: Number(id_reino) },
            data: { fecha_registro, es_gobernante },
        })
        res.json(updatedPersonaje_habita_reino)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al actualizar registro de personaje habita reino' })
    }
}

const deletePersonaje_habita_reino = async (req, res) => {
    try {
        const { id_personaje, id_reino } = req.params
        const deletedPersonaje_habita_reino = await prisma.personaje_habita_reino.deleteMany({
            where: { id_personaje: Number(id_personaje), id_reino: Number(id_reino) },
        })
        res.json(deletedPersonaje_habita_reino)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al eliminar personaje habita reino' })
    }
}

const cantidadHabitantes = async (req, res) => {
    try{
        const { id_reino } = req.params
        const habitantes = await prisma.personaje_habita_reino.count({
            where: { id_reino: Number(id_reino) }
        })
        res.json({ cantidad: habitantes})
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener la cantidad de habitantes' })
    }
}

const gobernantes = async (req, res) => {
    try {
        const gobernantes = await prisma.personaje_habita_reino.findMany({
            where: { es_gobernante: true },
            select: { id_reino: true, personajes: {select: { nombre: true } }, reinos: true },
        })
        res.json(gobernantes)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener gobernantes de los reinos' })
    }
}

const gobernantesById = async (req, res) => {
    try{
        const { id_reino } = req.params
        const gobernantes = await prisma.personaje_habita_reino.findMany({
            where: { id_reino: Number(id_reino), es_gobernante: true },
            select: { personajes: { select: { nombre: true} } }
        })
        res.json(gobernantes)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener gobernante del reino' })
    }
}

const Personaje_habita_reinoController = {
    getPersonajes_habitan_reino,
    getPersonaje_habita_reinoById,
    createPersonaje_habita_reino,
    updatePersonaje_habita_reino,
    deletePersonaje_habita_reino,
    cantidadHabitantes,
    gobernantes,
    gobernantesById
}

export default Personaje_habita_reinoController