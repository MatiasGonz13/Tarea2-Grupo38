import prisma from '../prismaClient.js'

const getTrabajos = async (req, res) => {
    try {
        const trabajos = await prisma.trabajos.findMany()
        res.json(trabajos)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener todos los registros de trabajos' })
    }
}

const getTrabajoById = async (req, res) => {
    try {
        const { id } = req.params
        const trabajo = await prisma.trabajos.findUnique({
            where: { id: Number(id) }
        })
        res.json(trabajo)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener trabajo por id' })
    }
}

const createTrabajo = async (req, res) => {
    try {
        const { id, descripcion, sueldo } = req.body
        const newTrabajo = await prisma.trabajos.create({
            data: { id, descripcion, sueldo }
        })
        res.json(newTrabajo)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al crear nuevo trabajo' })
    }
}

const updateTrabajo = async (req, res) => {
    try {
        const { id } = req.params
        const { descripcion, sueldo } = req.body
        const updatedTrabajo = await prisma.trabajos.update({
            where: { id: Number(id) },
            data: { descripcion, sueldo },
        })
        res.json(updatedTrabajo)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al actualizar registro de trabajo' })
    }
}

const deleteTrabajo = async (req, res) => {
    try {
        const { id } = req.params
        const deletedTrabajo = await prisma.trabajos.delete({
            where: { id: Number(id) },
        })
        res.json(deletedTrabajo)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al eliminar registro: Entidad relacionada con 1 o mas entidades' })
    }
}

const TrabajosController = {
    getTrabajos,
    getTrabajoById,
    createTrabajo,
    updateTrabajo,
    deleteTrabajo
}

export default TrabajosController

