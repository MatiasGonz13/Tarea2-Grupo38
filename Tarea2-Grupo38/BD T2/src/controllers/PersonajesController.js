import prisma from '../prismaClient.js'

const getPersonajes = async (req, res) => {
    try {
        const personajes = await prisma.personajes.findMany()
        res.json(personajes)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener todos los registros de personajes' })
    }
}

const getPersonajeById = async (req, res) => {
    try {
        const { id } = req.params
        const personaje = await prisma.personajes.findUnique({
            where: { id: Number(id) }
        })
        res.json(personaje)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener registro de personaje por id' })
    }
}

const createPersonaje = async (req, res) => {
    try {
        const { id, nombre, fuerza, fecha_nacimiento, objeto } = req.body
        const newPersonaje = await prisma.personajes.create({
            data: { id, nombre, fuerza, fecha_nacimiento, objeto }
        })
        res.json(newPersonaje)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al crear nuevo registro de personaje' })
    }
}

const updatePersonaje = async (req, res) => {
    try {
        const { id } = req.params
        const { nombre, fuerza, fecha_nacimiento, objeto } = req.body
        const updatedPersonaje = await prisma.personajes.update({
            where: { id: Number(id) },
            data: { nombre, fuerza, fecha_nacimiento, objeto },
        })
        res.json(updatedPersonaje)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al actualizar registro de personaje' })
    }
}

const deletePersonaje = async (req, res) => {
    try {
        const { id } = req.params
        const deletedPersonaje = await prisma.personajes.delete({
            where: { id: Number(id) },
        })
        res.json(deletedPersonaje)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al eliminar registro: Entidad relacionada con otras tablas' })
    }
}

const top5Personajes = async (req, res) => {
    try {
        const topPersonajes = await prisma.personajes.findMany({
            select: { id: true, nombre: true, fuerza: true },
            orderBy: { fuerza: 'desc' },
            take: 5,
        })
        res.json(topPersonajes)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ error: 'error al obtener los personajes con mayor fuerza' })
    }

}

const personajeConMasKarts = async (req, res) => {
    try {
        const personajeConMasKarts = await prisma.personajes.findFirst({
            select: { nombre: true, karts: { select: { id: true, modelo: true } } },
            orderBy: { karts: { _count: 'desc' } }
        })
        res.json(personajeConMasKarts)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ error: 'error al obtener el personaje con mas karts' })
    }
}

const PersonajesController = {
    getPersonajes,
    getPersonajeById,
    createPersonaje,
    updatePersonaje,
    deletePersonaje,
    top5Personajes,
    personajeConMasKarts
}

export default PersonajesController
