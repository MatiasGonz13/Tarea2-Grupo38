import prisma from '../prismaClient.js'

const getPersonajes_tienen_trabajo = async (req, res) => {
    try {
        const personajes_tienen_trabajo = await prisma.personaje_tiene_trabajo.findMany()
        res.json(personajes_tienen_trabajo)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener todos los registros de personajes que tienen trabajo' })
    }
}

const getPersonaje_tiene_trabajoById = async (req, res) => {
    try {
        const { id_trabajo, id_personaje } = req.params
        const personaje_tiene_trabajo = await prisma.personaje_tiene_trabajo.findFirst({
            where: { id_trabajo: Number(id_trabajo), id_personaje: Number(id_personaje) }
        })
        res.json(personaje_tiene_trabajo)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener por id registro de personaje tiene trabajo' })
    }
}

const createPersonaje_tiene_trabajo = async (req, res) => {
    try {
        const { id_trabajo, id_personaje, fecha_inicio, fecha_termino } = req.body;
        const newPersonaje_tiene_trabajo = await prisma.personaje_tiene_trabajo.create({
            data: { id_trabajo: Number(id_trabajo), id_personaje: Number(id_personaje), fecha_inicio: fecha_inicio, fecha_termino: fecha_termino }
        })
        res.json(newPersonaje_tiene_trabajo)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al crear un nuevo registro de personaje tiene trabajo' })
    }
}

const updatePersonaje_tiene_trabajo = async (req, res) => {
    try {
        const { id_trabajo, id_personaje } = req.params
        const { fecha_inicio, fecha_termino } = req.body
        const updatedPersonaje_tiene_trabajo = await prisma.personaje_tiene_trabajo.updateMany({
            where: { id_trabajo: Number(id_trabajo), id_personaje: Number(id_personaje) },
            data: { fecha_inicio, fecha_termino },
        })
        res.json(updatedPersonaje_tiene_trabajo)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al actualizar registro de personaje tiene trabajo' })
    }
}

const deletePersonaje_tiene_trabajo = async (req, res) => {
    try {
        const { id_trabajo, id_personaje } = req.params
        const deletedPersonaje_tiene_trabajo = await prisma.personaje_tiene_trabajo.deleteMany({
            where: { id_trabajo: Number(id_trabajo), id_personaje: Number(id_personaje) },
        })
        res.json(deletedPersonaje_tiene_trabajo)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al eliminar registro de personaje tiene trabajo' })
    }
}

const Personaje_tiene_trabajoController = {
    getPersonajes_tienen_trabajo,
    getPersonaje_tiene_trabajoById,
    createPersonaje_tiene_trabajo,
    updatePersonaje_tiene_trabajo,
    deletePersonaje_tiene_trabajo
}

export default Personaje_tiene_trabajoController