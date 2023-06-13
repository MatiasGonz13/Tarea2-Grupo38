import prisma from '../prismaClient.js'

const getKarts = async (req, res) => {
    try {
        const karts = await prisma.karts.findMany()
        res.json(karts)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener todos los karts' })
    }
}

const getKartById = async (req, res) => {
    try {
        const { id } = req.params
        const kart = await prisma.karts.findUnique({
            where: { id: Number(id) }
        })
        res.json(kart)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener kart por id' })
    }
}

const createKart = async (req, res) => {
    try {
        const { id, modelo, color, velocidad_maxima, id_personaje } = req.body
        const newKart = await prisma.karts.create({
            data: { id, modelo, color, velocidad_maxima, id_personaje }
        })
        res.json(newKart)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al crear nuevo kart' })
    }
}

const updateKart = async (req, res) => {
    try {
        const { id } = req.params
        const { modelo, color, velocidad_maxima, id_personaje } = req.body
        const updatedKart = await prisma.karts.update({
            where: { id: Number(id) },
            data: { modelo, color, velocidad_maxima, id_personaje },
        })
        res.json(updatedKart)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al actualizar registro de kart' })
    }
}

const deleteKart = async (req, res) => {
    try {
        const { id } = req.params
        const deletedKart = await prisma.karts.delete({
            where: { id: Number(id) },
        })
        res.json(deletedKart)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al eliminar registro: Entidad relacionada con 1 o más entidades' })
    }
}

const KartsController = {
    getKarts,
    getKartById,
    createKart,
    updateKart,
    deleteKart
}

export default KartsController