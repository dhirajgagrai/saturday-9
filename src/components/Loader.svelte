<script>
    import { onMount } from "svelte";

    let loader;
    let Component;

    onMount(async () => {
        Component = (await loader()).default;
    });

    export { loader as this };
</script>

<svelte:component this={Component} />

{#if !Component}
    <slot name="fallback" />
{/if}
