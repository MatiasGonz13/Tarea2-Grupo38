import prisma from '../prismaClient.js'

const getReinos = async (req, res) => {
    try {
        const reinos = await prisma.reinos.findMany()
        res.json(reinos)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener todos los registros de los reinos' })
    }
}

const getReinoById = async (req, res) => {
    try {
        const { id } = req.params
        const reino = await prisma.reinos.findUnique({
            where: { id: Number(id) }
        })
        res.json(reino)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error obtener reino por id' })
    }
}

const createReino = async (req, res) => {
    try {
        const { id, nombre, ubicacion, superficie } = req.body
        const newReino = await prisma.reinos.create({
            data: { id, nombre, ubicacion, superficie }
        })
        res.json(newReino)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al crear nuevo reino' })
    }
}

const updateReino = async (req, res) => {
    try {
        const { id } = req.params
        const { nombre, ubicacion, superficie } = req.body
        const updatedReino = await prisma.reinos.update({
            where: { id: Number(id) },
            data: { nombre, ubicacion, superficie },
        })
        res.json(updatedReino)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al actualizar registro de reino' })
    }
}

const deleteReino = async (req, res) => {
    try {
        const { id } = req.params
        const deletedReino = await prisma.reinos.delete({
            where: { id: Number(id) },
        })
        res.json(deletedReino)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al eliminar reino: Entidad relacionada con 1 o mas entidades'})
    }
}

const ReinosController = {
    getReinos,
    getReinoById,
    createReino,
    updateReino,
    deleteReino
}

export default ReinosController
